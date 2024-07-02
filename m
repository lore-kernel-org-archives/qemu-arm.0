Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp2430958dlb;
        Tue, 2 Jul 2024 08:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5bKo4RpCfqFMTL9NaSNaeMP1II4ftJ2eJalTtQ/MlGnY94J/AzkRGzcN6g+KTjJZ8i8HwK3BvTphYUWw/MZGQhLDZe+BM
X-Google-Smtp-Source: AGHT+IHAlv8eEBxljgburB/4m2WvaZ8y7iSKnY23WaLBqLUUSM/QTZB+2lgfjgg7Um/QAckKBE0x
X-Received: by 2002:a05:6214:f6a:b0:6b5:7e09:970c with SMTP id 6a1803df08f44-6b5b70cd742mr100734036d6.33.1719935079805;
        Tue, 02 Jul 2024 08:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719935079; cv=none;
        d=google.com; s=arc-20160816;
        b=oB4CX+oALCa1f2IICUJurNJKif0HAwRb5pGWqYpXaCYUE66G4VZkaahXBmKe+9JfNe
         wFZubXdZUFOUOYhNy62nxOlXwhiQzDsEmjfe0s76N/Weo17zpThP+qJXqzva4pI1zKaa
         6XyqXdjlBdt8Z8i1DkcaAJzbYL24Yka6jPpt4EW32N1Z4VXci7FIPuEDjsPKrgUzGy8F
         WBl4Ii4463zBR54yRMocTDEwY8F5o5AW4dMr1HLgs+TfpsUTCIHf51CvLAN4GHd6WvXI
         JuiC4RrrKPGquBOurhTvn+CY88wAPHU7mcsmUyx/lGlKIue7+UvTOmGfhqo8LCjxQLxX
         P7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NlxQXSZoT85mm2gHaHTGLn7lbEgSEbKZODT5yZdSUx4=;
        fh=vEhJ0w1cTOCYHff2NU9W09NoerGREUgzrcwmmENVr0I=;
        b=VGr4yVUiySChmWTRMtwhOIPWrAF0IhoUNaCVXFBtP5Df9+O9gbMG7yJaniscqk6h5N
         e1gT234oJKAg0xDARNUDHW7cueKv38W2Iix0khowgVpGYsDGItXeuQL0tQspeOv8VmW9
         AoqUL5pnJ6Vj36a/wihNX5eYI2e3rfgT4DpOr9IqtoSVRqGMQ/p/sNawXa5YDc6TBiO6
         YGGooEQKBXWmMStjiIPH2yXhfXoGcvJvLR/68rycPoz/UrB3XM1V6T7fiIyL6naxSdDQ
         He+TioTRv857kpUdIlraWvNFk7lEzy0C5KxiLWaO0YkVVaI6SooeAlhtVnK3kTYMhB/1
         MRXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bThedOUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e5ae001si104858376d6.308.2024.07.02.08.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 08:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bThedOUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOfgK-0000vy-MX; Tue, 02 Jul 2024 11:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOfgJ-0000vc-QZ
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 11:44:35 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOfgH-0004g0-Sv
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 11:44:35 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4257a390a4eso22216045e9.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719935072; x=1720539872; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NlxQXSZoT85mm2gHaHTGLn7lbEgSEbKZODT5yZdSUx4=;
 b=bThedOUkEj4jFXPV5s9kIZTAfOHNiK2RU1tUDtOfVYVYZTXFER5hn1CjGS5CC+1f3p
 BgSQ0e0/nUtsuZFuZHwltw7E0HD5Np6VYG8vGkXnLR5+37/wJkXGhmhA42RfXbBCuus0
 rTb5XRCX3tflA3bmAGQeQYUeKUYi1rOiAO+thoy3a5JR1SSLt7n0EEo3kcFTzMU3yVCG
 H+ceOXWLP7/ht/6dtM/fWvpBo+kE7DUW4RjyQgT4JWB7r73wP1vSjRVcPqcf6B6dJR7m
 f+sevsvFVF/mjvwetDN/xbxvs+D11h2x6kmDSEA67PHfNeQD4C43aDYuyQRMuYNMsEbU
 30iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719935072; x=1720539872;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NlxQXSZoT85mm2gHaHTGLn7lbEgSEbKZODT5yZdSUx4=;
 b=PqyQ0LR52akVTSytTLUC2ELvRQBtZm9tgel1kLB4xWqCYjnfv/NLp5rugDrOJQwI5j
 eMM+X5JuNTuzjaDOm9O+vYJJRFjMw67QsL/mHDoXCdiOpXBDse90nQLofAwo3dlTcN00
 u3H9rJUK6xi8Vuf13iGCdbQyCaI+DP4/IQFMGOmvukzBLgTOY8Diz3RXQWUM6a3j+0Xr
 g56DvMJdSQkuUYodIoYDl74FUBJ/qHlzEOZUFcCTeGJG8kc7WpiR8PA9yuVncqEEaUdv
 idVfauUNWLJPYdNubtn1m4KSf7e9yDifzQM4rs/q9ziN5WlQoztCafH0VsQFruzkyr5s
 KpFQ==
X-Gm-Message-State: AOJu0Yzsv7zAn0H3aNIa9vAp/ZHaH0Tl/GbkKGbmzoudKuES94lplW7O
 HufOKEqG3yP9itt9+rsWl/jkEpn2J/WYmU5UhO/MWNa8JcwZARssoA8SA6VKz5U=
X-Received: by 2002:a05:600c:4205:b0:424:ac9c:71f9 with SMTP id
 5b1f17b1804b1-4257a0282eemr54146925e9.39.1719935071796; 
 Tue, 02 Jul 2024 08:44:31 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.209.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257d04c742sm120833475e9.7.2024.07.02.08.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 08:44:31 -0700 (PDT)
Message-ID: <42fbede9-89fa-469e-bec5-b3d414c4e42f@linaro.org>
Date: Tue, 2 Jul 2024 17:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/char/pl011: Avoid division-by-zero in
 pl011_get_baudrate()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Zheyu Ma <zheyuma97@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240702152750.3017426-1-zheyuma97@gmail.com>
 <b72e40c9-c2de-487c-a9ad-a52c1f286d77@linaro.org>
Content-Language: en-US
In-Reply-To: <b72e40c9-c2de-487c-a9ad-a52c1f286d77@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: ksrqa0fBJeoR

On 2/7/24 17:40, Philippe Mathieu-Daudé wrote:
> Hi Zheyu,
> 
> On 2/7/24 17:27, Zheyu Ma wrote:
>> In pl011_get_baudrate(), when we calculate the baudrate we can
>> accidentally divide by zero. This happens because although (as the
>> specification requires) we treat UARTIBRD = 0 as invalid, we aren't
>> correctly limiting UARTIBRD and UARTFBRD values to the 16-bit and 6-bit
>> ranges the hardware allows, and so some non-zero values of UARTIBRD can
>> result in a zero divisor.
>>
>> Enforce the correct register field widths on guest writes and on inbound
>> migration to avoid the division by zero.
>>
>> ASAN log:
>> ==2973125==ERROR: AddressSanitizer: FPE on unknown address 0x55f72629b348
>> (pc 0x55f72629b348 bp 0x7fffa24d0e00 sp 0x7fffa24d0d60 T0)
>>      #0 0x55f72629b348 in pl011_get_baudrate hw/char/pl011.c:255:17
>>      #1 0x55f726298d94 in pl011_trace_baudrate_change 
>> hw/char/pl011.c:260:33
>>      #2 0x55f726296fc8 in pl011_write hw/char/pl011.c:378:9
>>
>> Reproducer:
>> cat << EOF | qemu-system-aarch64 -display \
>> none -machine accel=qtest, -m 512M -machine realview-pb-a8 -qtest stdio
>> writeq 0x1000b024 0xf8000000
>> EOF
>>
>> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
>> ---
>> Changes in v2:
>> - Enforce the correct register field widths on writes to both UARTIBRD
>>    and UARTFBRD registers.
>> - Mask UARTIBRD to 16 bits and UARTFBRD to 6 bits in the pl011_post_load
>>    function to prevent division by zero during inbound migration.
>> ---
>>   hw/char/pl011.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index 8753b84a84..ba5f7cfbda 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -374,11 +374,11 @@ static void pl011_write(void *opaque, hwaddr 
>> offset,
>>           s->ilpr = value;
>>           break;
>>       case 9: /* UARTIBRD */
>> -        s->ibrd = value;
>> +        s->ibrd = value & 0xffff;
> 
> LGTM but could you add a definition instead of these magic values?
> 
> Similarly to the ones in the top if this file:
> 
>    /* Flag Register, UARTFR */
>    #define PL011_FLAG_RI   0x100
>    #define PL011_FLAG_TXFE 0x80
>    ...
> 
>    /* Integer Baud Rate Divider, UARTIBRD */
>    #define IBRD_MASK 0x3f
> 
>    /* Fractional Baud Rate Divider, UARTFBRD */
>    #define FBRD_MASK 0xffff
> 
> Then use these definitions :)

Since I have the patch, let's share it to save you some time:

-- >8 --
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 8753b84a84..7f9a85708e 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -87,6 +87,12 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, 
Chardev *chr)
  #define CR_DTR      (1 << 10)
  #define CR_LBE      (1 << 7)

+/* Integer Baud Rate Divider, UARTIBRD */
+#define IBRD_MASK 0x3f
+
+/* Fractional Baud Rate Divider, UARTFBRD */
+#define FBRD_MASK 0xffff
+
  static const unsigned char pl011_id_arm[8] =
    { 0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
  static const unsigned char pl011_id_luminary[8] =
@@ -374,11 +380,11 @@ static void pl011_write(void *opaque, hwaddr offset,
          s->ilpr = value;
          break;
      case 9: /* UARTIBRD */
-        s->ibrd = value;
+        s->ibrd = value & IBRD_MASK;
          pl011_trace_baudrate_change(s);
          break;
      case 10: /* UARTFBRD */
-        s->fbrd = value;
+        s->fbrd = value & FBRD_MASK;
          pl011_trace_baudrate_change(s);
          break;
      case 11: /* UARTLCR_H */
@@ -531,6 +537,9 @@ static int pl011_post_load(void *opaque, int version_id)
          s->read_pos = 0;
      }

+    s->ibrd &= IBRD_MASK;
+    s->fbrd &= FBRD_MASK;
+
      return 0;
  }

---

