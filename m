Received: by 2002:a05:7022:108d:b0:73:d412:d72c with SMTP id ep13csp702542dlb;
        Tue, 6 Feb 2024 13:51:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVijPMU1RW7/mIsaKHXtkIhUNd3SE0mFBOSuVZUm/T7mqcxg06EYBZb64hQGiurqSCczbhWwtuU4KWMBdD2IpnsHgOlPWwK
X-Google-Smtp-Source: AGHT+IHAOPBY5WGQZ0VhrWlBNqqcCCZVH4qdIKYurWMIsVH6YnbfOfI5UApfKulS/Uing8RJbmnQ
X-Received: by 2002:a05:6871:5825:b0:210:ab2a:8e0d with SMTP id oj37-20020a056871582500b00210ab2a8e0dmr4765653oac.32.1707256290343;
        Tue, 06 Feb 2024 13:51:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707256290; cv=none;
        d=google.com; s=arc-20160816;
        b=QohpTBg0PBlLQnvcM/ZB5mv9Fh0DxpvOhmDpl4Nh6rHw0NwS/IVuvfFYXhpm7Y0N0/
         yBcp37AuvgtlnARcuEBp2q+iwC+qZuhoZig97jNg1MPG3Ul58RpdehbsOchSQN4BwOtD
         7zPX9O39o4HY5UGegk0NB26Mgz5TvEEfvEIyUoD1nwQ1WPhcgJnxW9N+KWotAWy3FRZ5
         Vb1FDlDsRL/f/x/cn6Teu5EZIswAmT7BUy3NcW1bh1HoeSD3kjxnnSR0kPFL7Z+w2EEe
         qP6wLZ52ELdr6eNPy+hp9HeapJvebJ1JpwFyu2Li/16KQ9Z93RhhfF7AkJ13QNuL/cMm
         t7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=lO1js4YTTotuzqoFGlHNRmsl+7c1P8LmWDHVkpLbSHI=;
        fh=NfukWYwof8NRuCKckFHR6i1o6+LtpqJsOC7hOIWnp70=;
        b=dbYn+V+hCTjlzXjIyaPJ3zDb8DJVEfV+7BQ+0L8Jx1wzUScYBLOWYbOoUEAMRmento
         GExIDddKI3DZ5VLtd62Vf5rZP6+zsvdPDiT2f6IQKewizEuynFX8h6lOZFHfFkv7/53r
         QECvGefMdb6RNV8eQVd/I2VL/jvjixD+YUXmHEve6ApEuoj9nLY7me564lk60yq//IBl
         aGv5hD8/08wAnqvZOVHiu9NJNYtpFFYlyFoUdjb7KxfflDWZayhE1hcW4KH6AiNsKZWm
         oDPUInP9VSIIPArzJpRXPPQLyfrQpbx6pZkrC6OjIH3TW+YUvrfC9yQi4jGrbkby0H3r
         hf6Q==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lbtlw7Km;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWrco9rNZHvnh8zuL2kGvHARz4suKQajHXYnjOPbfjuSHe7HuH/7pA5lvb9PPRJSnizDiUoea21Eth4tYu9L0ybrWvNzUpU
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020ac87e86000000b0042aacc878b9si3209684qtj.655.2024.02.06.13.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 13:51:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lbtlw7Km;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXTLQ-0007wi-Cl; Tue, 06 Feb 2024 16:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXTLO-0007wB-GG
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 16:51:06 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXTLM-00086h-Vc
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 16:51:06 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d746ce7d13so113965ad.0
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 13:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707256263; x=1707861063; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lO1js4YTTotuzqoFGlHNRmsl+7c1P8LmWDHVkpLbSHI=;
 b=lbtlw7KmMi20NjBqpOVD9+xyoIddHpaQZyFHIkyQkSAZIABPrP5Sr0nxz/TG3ThoEv
 ThXX1N/40J5XfWgk96fv0SjF72v0tqm/t3u49fZMM3PoF4SBhdjsFeiP2DQUHOZnDhl4
 pFCxzEXTVIXVBnZGIF+0PbtuDHzoskyBghxz3Xc9IC5Lx35mUtENxdhC/r+dQfOIZZXN
 YpL7LMku2k4vtXPKYzIHmhCdCYtgyeU4+U++e2rojckuO9Ph+MaN2Y5i1Ik+KDW70aFJ
 wcr/30jQqGsxGwhSn1sYYxH8UdOGsGpP3iLM+jRpytFjd5E2yaPRosPrBPGeBFQDDubf
 Fk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707256263; x=1707861063;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lO1js4YTTotuzqoFGlHNRmsl+7c1P8LmWDHVkpLbSHI=;
 b=Iep01Ei9riTTkunx+ukixrg4IzUYxhYk2G6W2dUkjCJYAmVEHsBwhu/ErG5bBTY5SJ
 UUfVYyY9tAIb4ZmcdigXCxO56ZLddbncu/sstm1SLzAdxUdpap4X+mm+7nBOGv16CK3C
 P5jesx4ziPxWyA6qkD6oUTr2PGDf5TH83eVUsG7/74Lr0KgXkr8/Cs/rja2+CWN4pTRU
 3dl2laiXoSv8umogJYgl6M40RlJ8NAxbYJr2iFjAqzDP9WPe7Z/nApLNpWslqkrZBjI/
 sxdwPrB2hYIpu3AtI5cx7C3gDNbJKpjnVinoBOPFoUzooUWID+oAcc35UurdxnkcLXlZ
 imOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCO0fnyjn3r4/D88c8ugObmbSxHLHDD8xnJQKB7GdURMYrCu4M91+eiHeVnkD4Az6grVVTWMa5yATbua+ofXeGv6e0
X-Gm-Message-State: AOJu0Yx6DSnakhZgMbpB1/tt/hSmnbfa0OtNesDMKO/lb3pYqI6ljyzx
 UW6ewpeYLntCTVXPbDqemanc+mcJoV7b+hVdPqGs/X4k2S8c1y0OxJgXD8EtQGk3LgUOUgDqNwQ
 fIGs=
X-Received: by 2002:a17:902:ebcd:b0:1d9:df9d:bcd3 with SMTP id
 p13-20020a170902ebcd00b001d9df9dbcd3mr2959332plg.46.1707256263382; 
 Tue, 06 Feb 2024 13:51:03 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXGYuJvgQhJAFPd1hdveV1BRy/oT3lQISqzU7j+vB/SnKytt98ny8Ch3LxXSrIrOdAOTIgxKKXyreOwibEHF02ubfjOHdfkTRZ9uG2zBXHISza/WAhL8t+bDJQ=
Received: from [192.168.0.100] ([43.252.112.200])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a17090323c900b001d94a3f3987sm2356974plh.184.2024.02.06.13.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 13:51:03 -0800 (PST)
Message-ID: <94d96365-1d93-40f4-96ee-e3fcb14a8040@linaro.org>
Date: Wed, 7 Feb 2024 07:50:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] hw/misc/mps2-scc: Make changes needed for AN536
 FPGA image
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240206132931.38376-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: sRqsDsBfMvyL

On 2/6/24 23:29, Peter Maydell wrote:
> The MPS2 SCC device is broadly the same for all FPGA images, but has
> minor differences in the behaviour of the CFG registers depending on
> the image. In many cases we don't really care about the functionality
> controlled by these registers and a reads-as-written or similar
> behaviour is sufficient for the moment.
> 
> For the AN536 the required behaviour is:
> 
>   * A_CFG0 has CPU reset and halt bits
>      - implement as reads-as-written for the moment
>   * A_CFG1 has flash or ATCM address 0 remap handling
>      - QEMU doesn't model this; implement as reads-as-written
>   * A_CFG2 has QSPI select (like AN524)
>      - implemented (no behaviour, as with AN524)
>   * A_CFG3 is MCC_MSB_ADDR "additional MCC addressing bits"
>      - QEMU doesn't care about these, so use the existing
>        RAZ behaviour for convenience
>   * A_CFG4 is board rev (like all other images)
>      - no change needed
>   * A_CFG5 is ACLK frq in hz (like AN524)
>      - implemented as reads-as-written, as for other boards
>   * A_CFG6 is core 0 vector table base address
>      - implemented as reads-as-written for the moment
>   * A_CFG7 is core 1 vector table base address
>      - implemented as reads-as-written for the moment
> 
> Make the changes necessary for this; leave TODO comments where
> appropriate to indicate where we might want to come back and
> implement things like CPU reset.
> 
> The other aspects of the device specific to this FPGA image (like the
> values of the board ID and similar registers) will be set via the
> device's qdev properties.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/misc/mps2-scc.h |   1 +
>   hw/misc/mps2-scc.c         | 101 +++++++++++++++++++++++++++++++++----
>   2 files changed, 92 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
