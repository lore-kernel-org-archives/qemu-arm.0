Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp621707njc;
        Wed, 13 Nov 2024 11:38:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW98/dclI2Hr+DNwMU7X5kOnEsRol/Lj9IWFpVb8x7yKJArrMCjL4LwtKk140cDpemyfan2d6nKLwBolw==@linaro.org
X-Google-Smtp-Source: AGHT+IHReAO6/5H7ZJ2CJjwLD/vUoDvpI2quvM/3bCI4XFbk7+9c75TlUyJenC7cM4WCg6Ds6Pnh
X-Received: by 2002:a05:6902:690:b0:e30:e9b8:abd7 with SMTP id 3f1490d57ef6-e35dc5e4ac3mr6109441276.40.1731526692299;
        Wed, 13 Nov 2024 11:38:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731526692; cv=none;
        d=google.com; s=arc-20240605;
        b=Bzxt2CETsipLyGQ06JoJgmA2hVvpQ4uK+f36wdefygToeqa7DSaiPOy7ommUIXWN9o
         LVZYmzbl3ABqThtWvoO4+G+EgKPUBaI1KKXCzzrauwEdrrOFUIZPG4L3ghcFrJM8KhB/
         mv2rEviBrYYJ5RjNPaL9A0WAoXcS/oIFZMj0vH91a9Y7cgRz8kj0Fs5CrtegryuThTDO
         2yZAC6XcMqex9uywPoC6WWO3HfpEojFySm8hYtTUr/nV+RcXe6r5E4A86zqjxTK6/zR8
         Mj5FG6/TYmazGV/DFR7hA2JfTgQdRlv1xSXAcICh3xOImX4fZZU/vm2oU9dmeexUce2w
         824A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qD1ABLAPdQ87uS0jehxCGNJMyaYBkoiPvDlF3YpZl0U=;
        fh=Abal2EttbGCl5opisl+js/eEVEVze/t0ZwX4mUDQnns=;
        b=LWIffmjF3QwVFO9nz2JccB+EtaOhL9xm3lvVO/RqB0n5X0OxGUixss4bgQBGJzVpZh
         tNPto7YDGdZwW+8l+9O/srEgwykMB/tJv+aLXnHaNYIIZdVPjURNO8DVEj2byeBTP5XZ
         t7xu1vu6hyDsyUTHEM3z/1L18cGKARrBsaxOWMazhDTOnZEGEyTVGAJTndG8SEMm8g24
         euzT+LUO3u4ZsN/ZK4piKzvswTMJFjM8rVQ9UJLFEIhjYYK2FrYcBfVGn47mzbsMVNf9
         5SqdO1JG1SPRS+MyPmV/4ihW/oQSdDwwVd5jQU1WGE3x/zepCKS7qlpAZtaTaY6ZngoY
         sq2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4CfJBuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3966bfc0dsi172664876d6.504.2024.11.13.11.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 11:38:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4CfJBuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBJBc-0003Vv-Bu; Wed, 13 Nov 2024 14:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBJBY-0003VG-Md
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 14:37:53 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBJBX-00028T-2k
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 14:37:52 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37d447de11dso5436178f8f.1
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2024 11:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731526668; x=1732131468; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qD1ABLAPdQ87uS0jehxCGNJMyaYBkoiPvDlF3YpZl0U=;
 b=V4CfJBuIucnuhhPGCDIvCjpH4qoHbGrs3hRVpTe58MNJR5ALKT27HiIIv563mnHqb/
 g1Qt1tG/zjRmvxR5e1uTSoVxWEhGNpsIXJOCGfMa4Ntwr4thoOXBGyzySpGH8r0mpwcu
 L6cwFE7qSbfPGz0u8zd0mrVFD3pUYFejNCV8zYD6ZiGJz9feiq+Nqt8w6AD4AUlxYJQa
 lt0noSc2/VgMCTAKofCdZAGy/XHRW7yQF9QNyI5kLGzQ86HWdC/3slPvcq5MfSR91g1d
 7JCU3VdH7FjzOUt0STsbcQW9oEBuJHALhgryhYe2o6siu4sgKbwcWJcoTal9fiXHTwPo
 frXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731526668; x=1732131468;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qD1ABLAPdQ87uS0jehxCGNJMyaYBkoiPvDlF3YpZl0U=;
 b=Qvuv8vfAid6fohWmsrj9snj/LDAEzbx4sHsFZy6sWb0wPxdrg7VsFn/LeKxWgV391j
 C/erpOGRCiPmUedMkDCsKgusoYf3QG0jNoVoZTmuaAURYO8bPB962tb09ohCqdhtGgOI
 tLhxGQ3FoyfxLqWj1teUImOqUuVWkaKMTcpr2VOZkcKvwcld6dGL2qnPc1nObY3j1QPZ
 LT2UYPhGiSfaYPg1CFl0GG1dpiN88+AgevaYt0X2P8glSeNExIoLyxXagroz2xAb5IDh
 78OlTHygzl+fbm+UvGRmzZx8rwY3TJ6KTDUttI0aMW6wlvr6dXRTdhRXUEdatKjbAo2H
 QIeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvWvumoCk88flTM6dvWuxFZJ1XkuewBNkQHMlCKPILvbDpo4LmixAAbGTc/Rd7CFUNyX+38G787g==@nongnu.org
X-Gm-Message-State: AOJu0Yx6Qk3G/JkDXKt3tCLMtX6MTxFA7jgyxymhklmTCCaLIGMIiRkd
 pBA0TSH9DWSxrMs9XNIurT/MQJl2ZfEnNmYcU/lak2DdN2DXSY6XSkS9WSj1bto=
X-Received: by 2002:a05:6000:2a1:b0:381:b1b4:8ba1 with SMTP id
 ffacd0b85a97d-3820df886a5mr3476895f8f.39.1731526668626; 
 Wed, 13 Nov 2024 11:37:48 -0800 (PST)
Received: from [192.168.69.126] ([176.187.209.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda0604bsm18912953f8f.105.2024.11.13.11.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 11:37:47 -0800 (PST)
Message-ID: <a96bdfaf-44ce-4bfd-86be-37e0faa8161a@linaro.org>
Date: Wed, 13 Nov 2024 20:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] hw/net/xilinx_ethlite: Map the RAM buffer as RAM
 memory region
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Gustavo Romero <gustavo.romero@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
 <20241112181044.92193-20-philmd@linaro.org>
 <5a3d70f5-e135-4450-aed4-eac03abc58c0@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <5a3d70f5-e135-4450-aed4-eac03abc58c0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: z+46i+Xfkh+L

On 13/11/24 18:21, Paolo Bonzini wrote:
> On 11/12/24 19:10, Philippe Mathieu-Daudé wrote:
>> Rather than using I/O registers for RAM buffer, having to
>> swap endianness back and forth (because the core memory layer
>> automatically swaps endiannes for us), declare the buffers
>> as RAM regions. Remove the now unused s->regs[] array.
>>
>> The memory flat view becomes:
>>
>>    FlatView #0
>>     Root memory region: system
>>      0000000081000000-00000000810007f3 (prio 0, ram): ethlite.tx[0]buf
>>      00000000810007f4-00000000810007ff (prio 0, i/o): ethlite.tx[0]io
>>      0000000081000800-0000000081000ff3 (prio 0, ram): ethlite.tx[1]buf
>>      0000000081000ff4-0000000081000fff (prio 0, i/o): ethlite.tx[1]io
>>      0000000081001000-00000000810017f3 (prio 0, ram): ethlite.rx[0]buf
>>      00000000810017fc-00000000810017ff (prio 0, i/o): ethlite.rx[0]io
>>      0000000081001800-0000000081001ff3 (prio 0, ram): ethlite.rx[1]buf
>>      0000000081001ffc-0000000081001fff (prio 0, i/o): ethlite.rx[1]io
> 
> The receive buffers should end at 7fb and ffb; no need to repost of course.

Nice catch. Actually, looking at the datasheet p. 20, Table 11 "XPS
Ethernet Lite MAC Memory Map" we have

0x0000 - 0x07E0  TxPingBuf
0x07E4 - 0x07F0  MDIO if C_INCLUDE_MDIO else Reserved
0x07F4 - 0x07FC  TxPingIO
0x0800 - 0x0FE0  TxPongBuf
0x0FE4 - 0x0FF0  Reserved
0x0FF4 - 0x0FFC  TxPongIO
0x1000 - 0x17E0  RxPingBuf
0x17E4 - 0x17F8  Reserved
0x17FC - 0x17FC  RxPingIO
0x1800 - 0x1FE0  RxPongBuf
0x1FE4 - 0x1FF8  Reserved
0x1FFC - 0x1FFC  RxPongIO

I'll update appropriately.

Thanks,

Phil.

