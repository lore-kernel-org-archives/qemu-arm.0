Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp418767njb;
        Thu, 17 Oct 2024 13:02:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIIbAlmDn+86CEE7QF9hRMxXwZ2u/MKnbBo6/SOMLlQfX+AAgJnLmmbBN3w1rzzp4YMG1BTgXnTdrzQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGqC33mfVsGwUMrQgAme4HPKqKhSHKSzbgyZdOAGVCoyNMLihMHQ9fZqX1LDTJpmvfRCJ7A
X-Received: by 2002:a05:6830:6f89:b0:717:d068:c375 with SMTP id 46e09a7af769-71803446becmr8315577a34.13.1729195336338;
        Thu, 17 Oct 2024 13:02:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729195336; cv=none;
        d=google.com; s=arc-20240605;
        b=kg8nt5oVemcLk4os+MitM1Ph+C8zf6trnv9SOEZ6BPt3nPEF8FoQ/ZyhE7M021Cl5V
         IYAITN0lkfSSbU48TzZl7+jQBTMN4TdYVDK8N76Kgslx49vJhb7ijX6dvI13BpL9LG7d
         e1t7X9agPN5CThaBvsRqD+a/1bKdipyCKYbUyRQbNzIx9i7vZAMTwTe3hqTQMzNSARpL
         p5be8+6hI/RuzJkqx8ePFK1saRKrC9zxFv9E4NQbjSjh36fH3qHQwC38kMkg7zg8CU89
         fiCNOSkZ4mHuQCsl2DrPgzQAYhuSXT2gx3uZR6I61hvQhIT3ZryIazUAVhoLOTSGMsU0
         p8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=qXMlsPVqdUohbuotj+XekcsY/ZDHSR3Ki6REfk32/nk=;
        fh=gBqmWShwHFHj5QeKEGXsVkmjaD+yvxsDQe8GYxzFXoo=;
        b=iR0Wov9kHUiWeQ+ZIhhzILeNdAzCTNroKHetgIAAqQu0J9AVc/yEgG4/ujJkGUqfPu
         HHfkFxhWbQnxT1Z3qLc9rt2zRXmct3i/xVP+LPEvy8pKCW31e1GbOSCkWhpVOlEVQ0ql
         OKw1Gu0nX4WOnsPWT0WyEl+1ycQTo6knU8Sc0hnQOyhW5zl67X+Lg4ca3RAC0I7MzKGY
         fuRPCHT09J++TuSMJ8vwB3sjUPGI9eILRTwpoPHWWwMUfjnoRT0MYpfpXOxIi2eh3w6P
         VTM6jO7MlGBuwJzh/ir8bDSN7PjZVMtZnszsJJMK4jdmvgu92B91ltQXfIQP+KE3SIs1
         Q0aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=BEQFXWq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a5d646b05csi8962137.670.2024.10.17.13.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 13:02:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=BEQFXWq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1Wge-0004j0-B1; Thu, 17 Oct 2024 16:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t1Wgd-0004il-4L; Thu, 17 Oct 2024 16:01:31 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t1Wgb-0003wU-A0; Thu, 17 Oct 2024 16:01:30 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-71e49ad46b1so927675b3a.1; 
 Thu, 17 Oct 2024 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729195287; x=1729800087; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=qXMlsPVqdUohbuotj+XekcsY/ZDHSR3Ki6REfk32/nk=;
 b=BEQFXWq91uPrjiHzVMhv2rR26dTnC1Mv2v6+t8Wbak+TRMqGVwuuRureOcqiB0Olpk
 1bXxEyNaXUSh14WUsDlRDyLQTyqyfVj6dZ9bjqcQOTlfdWA5id/jEYrhVwg8r4MHM8jD
 0UV7i0Z03pPKtTYeV8n0sd9eZfo8fMWCCyT+mDggiMOq7aCaS13GVJ7T/37wDqPwfSTo
 pGpEZQ+tSXTMpohirSKm9zJbchT9BONuZkiDueklSKhLN2lB2Q3ar5gRgOdGGeTrZQwX
 Et4uPUsnTa2iwczNhg0fI3k52yAOX15PwGb1oAFXshQKlxdtuvSAwFCPhbiJ2remtamk
 qCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729195287; x=1729800087;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXMlsPVqdUohbuotj+XekcsY/ZDHSR3Ki6REfk32/nk=;
 b=uz8qEMGqJiYeehAC9SAiDw0Vn12AvsBpx1eHKihBI6lnkTKPvlLhSd54mMjjzSLAx8
 FizQnieqpfAntt27x5vAnFQr4TpPv1Ip7wuIcioKCz1z1tkRLKEGmdXtVv7s675yPSBd
 RoMeJwTYPaYI3eaI948OwBp97PFDSKZGG6f2Bs7A4oPVGqculH9id95E74mrAEv3cX9N
 dwWnVmruU2xJ3UmR1NAd2/pxUcL6+OTgaofozyrJpLKATmpqay+27jDcaX+oD6KpgwSL
 XNiHrydkWEZl22FvFwuqdeb8JDkVBqceVMuLLbY3786xMfZxY6Onwdxg7S78hUCRfy+k
 zE0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdKT3aV+TAKvc/uQcmqiyPh0MoQGchRTaBXC+jMDAqUjpRy//LPIxG0C8vAwNTTJu1kB5KHKF71elpkg==@nongnu.org,
 AJvYcCWUufSB2r9ObKMFI5fvQk7wBgbm6gWdHOJAN0bWBFR9nVeEyzgt3XVbvG7tWo2FI8TPrmUPrjZ+Bw==@nongnu.org
X-Gm-Message-State: AOJu0YwkaSiIsw1l3TWN2olkOs9Qwsp2iMy7s3Uz7EI+n7uWiXnEAKMF
 CyfGQf/VW2Km124tIZreOUP9iFyKxVrKgiiZ4a+1uSEzCLln+98vMlJZiA==
X-Received: by 2002:a05:6a00:2d25:b0:71e:5950:97d2 with SMTP id
 d2e1a72fcca58-71ea3328e08mr136694b3a.17.1729195287121; 
 Thu, 17 Oct 2024 13:01:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71ea34095f5sm39252b3a.117.2024.10.17.13.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 13:01:25 -0700 (PDT)
Message-ID: <a7f786dc-860d-4b5e-8e03-4bc4d5539ad7@roeck-us.net>
Date: Thu, 17 Oct 2024 13:01:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/sd/omap_mmc: Don't use sd_cmd_type_t
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20241017162755.710698-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241017162755.710698-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: NhBx0doxtylT

On 10/17/24 09:27, Peter Maydell wrote:
> In commit 1ab08790bb75e4 we did some refactoring of the SD card
> implementation, which included a rearrangement of the sd_cmd_type_t
> enum values.  Unfortunately we didn't notice that this enum is not
> used solely inside the SD card model itself, but is also used by the
> OMAP MMC controller device.  In the OMAP MMC controller, it is used
> to implement the handling of the Type field of the MMC_CMD register,
> so changing the enum values so that they no longer lined up with the
> bit definitions for that register field broke the controller model.
> The effect is that Linux fails to boot from an SD card on the "sx1"
> machine.
> 
> Give omap-mmc its own enum which we can document as needing to match
> the encoding used in this device's register, so it isn't sharing
> sd_cmd_type_t with the SD card model any more.  We can then move
> sd_cmd_type_t's definition out of sd.h and into sd.c, which is the
> only place that uses it.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 1ab08790bb75 ("hw/sd/sdcard: Store command type in SDProto")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Tested-by: Guenter Roeck <linux@roeck-us.net>

