Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp736018njc;
        Sun, 9 Mar 2025 11:52:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqO+US0j4OGMm+/Uq8i6zuffuzu863w0YCFisL5M0gd+9UFYQ2oZKW2UrTXvgmQnIcBnq9zcQsVTTBcg==@linaro.org
X-Google-Smtp-Source: AGHT+IF8BaeUXBG39oI3WHgRadCcIZjrZP81Y7w8z1t2FFGcJHhYjtq1/wbDNVGXGL7curhh0+Ba
X-Received: by 2002:ac8:5dd2:0:b0:471:bbd5:aff2 with SMTP id d75a77b69052e-476109551a2mr141141121cf.10.1741546373382;
        Sun, 09 Mar 2025 11:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741546373; cv=none;
        d=google.com; s=arc-20240605;
        b=W6GqzjuFdqjoTaghtE8+F01lKuCrSU07uZ9gykD6YljZ0v5AEWFWYZEbplm3Xcy8LO
         kAjok/GU8UXxs0JAoDHtLpdTpLej2xzrE3+7ASH/vVrAr80gNZVm7kvCRUeTyS4FiX71
         OajxHFJRajhHs9Di++Czn5NfYCKemNYCGK7BFl8TZvEitdyaw42zXT0un1cFQfIjsMV0
         NRGuRrAeT6j3FYa9/URkLGGZNpl9te7CsfNY7oZisnyVOOU5om/CsivV+Urc6MRdQTVN
         vK/PfhtJz7YCLEICb1yUWRh+ur8d15ouNmkGWdFf2jk8wOP134XVU8kkzMAvcPYINm4F
         nVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PYr/SvqZEdUOMqOgX0098OzvfED2AvZPVLedou7WRAw=;
        fh=jxaz5+ObpppqZt4kMhNDbFcrD4m6kJh/CtcsSzpQydE=;
        b=GMVpAx8rTJHIdyd7Qu0ZWE+rwEElEKyVsPA09zPNY0MJMg4Uixf6Hz3WN9N53NXJi7
         6xFdMEZOTuhM/U033vB85BQXAJPDaItyDXZEU7vcEgjm7CWsI5CEsQ96hRGY00S9xbOb
         CoM0puQ0OQd2V6/yp3lzNnYe1jyXxTrKJAO/J7/uVHvzOmSLf1y09Pr4G6nXCvd6843y
         5IVWtgFr5D6nL3LF/iAqFSwtKpdadFJC1rKjepjlUEkl/yWLJjkiBkUwY9Nn/G3rZn/C
         yAGWtAC2McktZvQtjHWAlQknRiN2EBSjFf/vyc+/X3bNKY/umoEqMi0I7PL4LXQ5LiHR
         MXjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DU/j0Ixs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4767beff93dsi18496101cf.103.2025.03.09.11.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 11:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DU/j0Ixs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trLlU-0006yu-6Q; Sun, 09 Mar 2025 14:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trLlS-0006y5-5R
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 14:52:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trLlP-0002lD-CR
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 14:52:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3913cf69784so1287155f8f.1
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 11:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741546357; x=1742151157; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PYr/SvqZEdUOMqOgX0098OzvfED2AvZPVLedou7WRAw=;
 b=DU/j0Ixsq+w2HU1F6dzbGods3FRjyAVsciDSlMnwyLW4+TnqFngjs3aIgAT9wHPllw
 8NsRbNLJptzBzu332kobbSSjGe6yOGnj9WnKbtPNdr6PR1GpugLKGj8KZx9ngsAzmyJ8
 EnpqcRCjX4BqJoY/1jIqxVPxTHZ+IbajO1j+HUnceQR+DCL39CihG327QYPdpUtRzvXD
 RwJouD/R6HqdeOTlS8/fzSHdqSABTMWUymDu87cXOp+hPv8liDSxpGH9qWYV/yyDOJVy
 EzF5Lfd5cKBejBJvZ7aYDKeqKb+r4ybSIPO/NIMwjiFUv0QZLqvw5oCKbTGmGRklZgDL
 tqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741546357; x=1742151157;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PYr/SvqZEdUOMqOgX0098OzvfED2AvZPVLedou7WRAw=;
 b=byxBR8nWyxVR9SI51YqCYmuf/OVRIQB1iXsCBSHFiS0zwTpFb0zJ72J+aRO028S5A8
 xLNQmDa0Ls3RaRAcQOm74VIhmGxf6CYZCjp8yzFj0EWr3m/obQvn2JiivvcyqwMS1J5v
 65DFPfFeGDdhU6I9MUZGUpp71y9cQNwJZiGSqyLVmHRAnlg4N5hezoAOLn7THk94fz7K
 YiNN1kAJJ//Cg1TldMgC2PH6H4R/w/9wGNkJgxOTHEEwzMfCENBA5ZWTBuZucpAjxH2Y
 TzgfhDZ7WDVslQ/FkjvkpTUvmvvxrMsEmYkw6tqnRcRTRw5x6bpp7sdVgk+fpuMF0cky
 bwmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDXqEOaoAqjZNiQxNDsuQoGbBxfV5dNDKtSJAZ6batbWRlO1W4DwkwpFgWFXn+bzWeBwHFdHycTg==@nongnu.org
X-Gm-Message-State: AOJu0YzkF0UxBiS82fS/4UKdtIiQqsNT0peysl6YGAC3AgeTgIr0wR3Y
 8FDkFsFapjC8S/BuDuJza6GCuztkmw6bUtDoU6bscNLciuh+X8PO0lulfHOBwWo=
X-Gm-Gg: ASbGnctl3+bhCGlVJCAXGVgcOA8A9PwlmIh1eENIWmqBND2Fb2+qZx+wTZaubheeona
 EjyYcYyIg2eTFDMEwu1GkGpHZDUCBTofpWQmMbixR/D8eKFJ4X0w5Rg6cz6P1MKVg45T7Rrd5Rx
 qLhHhBtZU1tiVg0FCqwwGspG4ZRIt7FQh4tFvch+rnTKNMqL3f711nwk7ykm4rovYVq10znhB7p
 2l4EgLuMaeF/L/6ThvvQ2DZVsUGnrcViHnT1F1amTQu/IodrSOnNRz9whvYybWWUGr3UlEzekZn
 gRuc8oA6LoioG2T2j62ZkVIJds5JiJ2oMd0m4tO1s+2DuETuqRI/COhb17u2zDlKCZbTXJ9ZI1o
 Da4LsyJshCSORWla4QHxI+Ks=
X-Received: by 2002:a5d:59a8:0:b0:391:328d:65a2 with SMTP id
 ffacd0b85a97d-39132da24ddmr8685921f8f.38.1741546357385; 
 Sun, 09 Mar 2025 11:52:37 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c103808sm12736990f8f.97.2025.03.09.11.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Mar 2025 11:52:36 -0700 (PDT)
Message-ID: <a80f3d0f-2f74-41a3-96e3-c3fb9c0b7440@linaro.org>
Date: Sun, 9 Mar 2025 19:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/net/smc91c111: Sanitize packet numbers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
 <20250228174802.1945417-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250228174802.1945417-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +5aaSvsGhsqJ

On 28/2/25 18:47, Peter Maydell wrote:
> The smc91c111 uses packet numbers as an index into its internal
> s->data[][] array. Valid packet numbers are between 0 and 3, but
> the code does not generally check this, and there are various
> places where the guest can hand us an arbitrary packet number
> and cause an out-of-bounds access to the data array.
> 
> Add validation of packet numbers. The datasheet is not very
> helpful about how guest errors like this should be handled:
> it says nothing on the subject, and none of the documented
> error conditions are relevant. We choose to log the situation
> with LOG_GUEST_ERROR and silently ignore the attempted operation.
> 
> In the places where we are about to access the data[][] array
> using a packet number and we know the number is valid because
> we got it from somewhere that has already validated, we add
> an assert() to document that belief.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/smc91c111.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

