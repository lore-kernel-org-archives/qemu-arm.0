Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2220830njd;
        Mon, 31 Mar 2025 09:16:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcF+qZ/P/yclYemH+vkdHSTmtxlNnJj1+cWOMb+aAA933P1xeyLuE1noukhVU/xqPlnrv4QMuXmVathQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGb9FnqK8TkdMeknAfyUpUfs43VQ68U9W7CkPV40KncpiCuZDTv/JMqcv7NmXFkpgmSSbhy
X-Received: by 2002:a05:6102:38d4:b0:4bb:9b46:3f92 with SMTP id ada2fe7eead31-4c6d383afddmr5318032137.1.1743437763130;
        Mon, 31 Mar 2025 09:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743437763; cv=none;
        d=google.com; s=arc-20240605;
        b=YWCW54OkSHd8gAjji/wnPbFpzeCeVEmJBs9aXauHyEX5B0GHo7WaAFk5ZJjWzEs9D1
         CXog5XmLP06WyXETYK+Oy6YY2woLCOVv7AOzaeP3eiCh80lvh+Ora5Wc5GJ9lJicc5K4
         oJyUnq8KwTJkNWLvq9zK4iCaICgJiU9c4Re4e3lbaGbjxkBPyXyKeQWCkKZnUKhYCxXH
         1A6gMvZYUtjwQMH5lx+5rRBgNePvFiuhsK6EseVGNhdCFn7SI8r/3x4HYEpI+HIS+2zw
         Rn8qOSq996ajw29yQuOAFVm5Tocfj8iELRlLRxHmow1q6pBk/twsSwHErvD49s61FCKb
         UT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9689pOzOcnr692n5+VxzO3lhYTf7JXr5AdR9IwYqDI0=;
        fh=gIbcyjQyU/W+QF7qEKn2ChVaNpFso7Uq8A7hmofHi9o=;
        b=VIKroaW5CE9l2YDCtL/cYmGWwXYsO/L2S+6aQ2aFa6X+iEgdc3lNkztyO4WsZypdKz
         m4e/7Ysmmn9sQIl387B0PIU2X35lzJdrr8AeIk4ohvIZTHyZgV4GGEYQq/PrU7H+ZxgX
         mtIFSdfirVO5SmQNh2JCjzq0DfpqtkFzFtKYwyDxYbs1b5AcjnA6gc/XnJA0VaqXnTht
         ssNqCe1DWZ9wPr9lwXWUG1tDazc+TeVGkgJJj96/YXHa4KOlWD35oO3ZjTj98X4hfYkg
         31MmX2ZAf+9euRHuGR2u/6+URq1TTavtqyb9eJBLNhc9oMnu+Lz38FP4UbKRjf5lVi+F
         W+xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Cug/sfmf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c6bfe500dbsi1701847137.466.2025.03.31.09.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 09:16:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Cug/sfmf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzHnP-000204-4H; Mon, 31 Mar 2025 12:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1tzHnM-0001z2-G5
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 12:15:28 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1tzHnK-0008MW-Mk
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 12:15:28 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-224100e9a5cso84602245ad.2
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743437724; x=1744042524; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9689pOzOcnr692n5+VxzO3lhYTf7JXr5AdR9IwYqDI0=;
 b=Cug/sfmfYgEy2RXrXrNjOUVaNKmeWsFwe11k01JdXGv8j2QIYXI8ctSJH3UOzAuo6g
 eP6B2WmjIGVthysHMsW+x2SzfgZidWUzDcZ0k85JcxQ91YzS4qTGzhxPm3h+82IS/iGN
 CBTdOyOlE9ZbmOYYvWaqhZlLmxplVg2aXMGyAA/YhZfunzRnwKZb4Lskmo2l2LWKoq4Z
 9ev8IMhEOsjryf8Quc10KiwcV6S7wyTwr8bbYzGgglh28k9mOu3XfKIqLatygofN3IrD
 7RcKH56i5kO7nzd17o54tyygjjcWavPd5TYEPVdqCyAZN3cZAYQpe6WX+ttQCPISMCNA
 /zpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743437724; x=1744042524;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9689pOzOcnr692n5+VxzO3lhYTf7JXr5AdR9IwYqDI0=;
 b=dpTsNMGoaFo/9MKgtrfrFkm7aHd4jypeNQqzpEZcXms5VmEQmsyY2flFYARleVgMQF
 ZogaRkjhHbwO787Moce9euxzuWuwyyHnNkRcbQcBk8mUzxNnsIBm5rbKwUo1JchjrL8W
 xQajsySQ2jXGur+4EQ079xgOARm/KC+0lgNTw8SIGHGvPTes4cKjmhi28lXMLMnHXDaT
 ivnMUfVkuHrJA5bbblb0c5AoEl7rBu3oxOn7z7ATRB/OYSx3GRGOBFgkRt54xy5nMIVH
 Ct8saf2AlkgnYeYZSAWkX7x2XaLhDadvMfYwlNEhDr0BQAj2nFNEHBBq7nFctc+sLxvR
 8qKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvYNQ3H66mf3Xc6HH1OTF/AGxqgULVIkq3aKpszlguGcqgolrk7FoxQdTOiUQP5vc6mRB6k8AEEg==@nongnu.org
X-Gm-Message-State: AOJu0YypMzpSiRdqWD/qbjWvRFBd/tulAyqIaH63Hve6dAWpw4LJa4fL
 IUMb0XSC2CybKv7oveNZK2rqiDD8/740+7SgZzesYU6FbvUPFhbXIKUUfAljFJQ=
X-Gm-Gg: ASbGncvvEdqJQzPzXHjvxaf+h9Of7S5L3351nxK6Vuu7DbGRg733X/vGGqv1BpL7xsp
 MeklgvQb5hK9Sw6ZuNrTxsoMWoUvIocHNGtwevFJTAfKO327NG36b1YkklXwkK39nT4SAICebMN
 AOySR7D9t0/cei8iIG7F2GcQiBxavSJ4uq12WZ3tAh1j9PwV3dj3q6eMHSY8VFL+6ynDDNXEDTF
 +9YLfESyu9yUpPn5kSKUECZta2z9IGNbBmGN34WMYzLBUT6sjoNS83GFrGPy3IdrehEKVEf5QbU
 eeRXLtz4jbs6OdE3UHrP2BPfVCOq2eMr9JQz6smeq3fe7bqUcYxCKmn8lZhDN273Rz4=
X-Received: by 2002:a05:6a00:a85:b0:736:450c:fa56 with SMTP id
 d2e1a72fcca58-739803238ebmr12482252b3a.5.1743437724503; 
 Mon, 31 Mar 2025 09:15:24 -0700 (PDT)
Received: from [192.168.0.102] ([186.215.49.85])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73971063d19sm7372763b3a.90.2025.03.31.09.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 09:15:23 -0700 (PDT)
Message-ID: <86700de0-42b6-4403-bd9f-1334e22bcfa8@linaro.org>
Date: Mon, 31 Mar 2025 13:15:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 1/2] hw/pci-host/designware: Fix access to
 ATU_UPPER_TARGET register
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Joey <jeundery@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-stable@nongnu.org
References: <20250331152041.74533-1-philmd@linaro.org>
 <20250331152041.74533-2-philmd@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250331152041.74533-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vIAqg0/Ghib7

Hi Phil,

On 3/31/25 12:20, Philippe Mathieu-Daudé wrote:
> Fix copy/paste error writing to the ATU_UPPER_TARGET
> register, we want to update the upper 32 bits.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Joey <jeundery@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2861
> Fixes: d64e5eabc4c ("pci: Add support for Designware IP block")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci-host/designware.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index c07740bfaa4..5598d18f478 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -371,7 +371,7 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
>   
>       case DESIGNWARE_PCIE_ATU_UPPER_TARGET:
>           viewport->target &= 0x00000000FFFFFFFFULL;
> -        viewport->target |= val;
> +        viewport->target |= (uint64_t)val << 32;
>           break;
>   
>       case DESIGNWARE_PCIE_ATU_LIMIT:

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
