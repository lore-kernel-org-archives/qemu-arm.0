Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2693240njk;
        Mon, 2 Dec 2024 02:54:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXtjjrVzgSpQZ/a/2LIi7csw1L+H9+dTKhXjbDqkjzTZAs1+kG48DbCROhblItH/r/HdMjqH1v06Cf2ww==@linaro.org
X-Google-Smtp-Source: AGHT+IGX+/P2HhNck2umMM0E03IQrOW/5BYDBdwbD6/M6vL1HCi9Q6lwXj9kTQDYEbBbq2x7rDio
X-Received: by 2002:a05:620a:2794:b0:7b1:5089:485b with SMTP id af79cd13be357-7b67c2525f0mr3712709685a.3.1733136861488;
        Mon, 02 Dec 2024 02:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733136861; cv=none;
        d=google.com; s=arc-20240605;
        b=EnabhdAxc5PTnVAwURdScea35Wa6dPEU0sQG+DaLJ6phwwElfILXKXdk6dpsY1e8b0
         v0XVf6YapeuEPnSvRIvUbHKT+k/vLFv6pyX16L8R8avuFdbR/c5beDJEQLNPf5ePwuLn
         cOv1nLMicnjIsS0spact5zIFYyizJzr0ctcQqZvJbsKFjLTOqpBoaQ9BGpL5VrFxuwLV
         cSFlHFShfYLDb7bQL5qhlj7VQtg7Yf10YcrAL3JNG67bT40+g1Ncj7Rw6CXcbYFkHjTD
         PS6SFcmuteOxl/oEMQv5Mo2bvuhfU4IKhsP+FKOkYwy3XbO5Vc+ui4Ds9LpZdnxca2v9
         8Yrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=7i60CMqUFFvcLcI7Fj3fPaX15CPhB+4GrtpNLVeRe6I=;
        fh=KCmaW40SnSqauWdxRT9z3N6NK+0yg8LbMpcNg9XhqQo=;
        b=KrZVoBNrjBamVf3RG84cQchuGLaLPdRzyu6h/DqJM0dGsmoNETtNqj5msfmhUDgrUB
         x7FY7fe5I/58AYi6HqLj6+8nRNm3Sl2ZHK1dBIKGTkS8NoOP5EOMpW9CjwxM4prhGNxz
         7xon47ZrTz//k6pHq2el2efq3ny0bw05LT/z5YPC0F6Bdpuk71tO0aK25HGoWr5oyLUZ
         FLVMH5EhTd/3hBD5qOA3C6Ch7ZW3m9yt2mEgDWBmHyKAkm3+O8zXOA/m5aSGvf9cGROi
         fHSe+P+OcV56WUTzeGkrIn5qfTstnAr+KfBfSdhAFou2/ygydEopGv+Frx343IgqduZm
         8c9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zhuQ9B+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8a3d96fd6si34212016d6.394.2024.12.02.02.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 02:54:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zhuQ9B+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI43t-0000jG-Ts; Mon, 02 Dec 2024 05:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tI43r-0000iw-T1
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 05:53:52 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tI43o-0001M3-2y
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 05:53:50 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ffd711274dso45761091fa.0
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 02:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733136825; x=1733741625; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7i60CMqUFFvcLcI7Fj3fPaX15CPhB+4GrtpNLVeRe6I=;
 b=zhuQ9B+Vzzg130F92SQygII7TspJoup1cO1u9N6PwA774BPVwuY3VG2zatNqcysxTa
 3qoayManyw5N7eKbdNI7O1zvHanuaj3g10PiD3UyWJz1eRdTbpwLQkqjXsPgGRCjym4Q
 YMrINkVH92UVUb7tT5x8lsRQ0dExsNPdugS8lm1xe27UCs3AeTMK+6SQuiU0iKqGcKB+
 q3UhuAgilbqY+OP+PX0zIzaxgPiwGb18+3fQoHyuQrxxTZ6lxU1bZMbbVyJTYLanCzZY
 +7Srtz2akodNY9IsqQYqArLjHG2vZcmizqkQ7WICW0LpToGX6jb7cK31jfh5zIgCPlhl
 gnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733136825; x=1733741625;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7i60CMqUFFvcLcI7Fj3fPaX15CPhB+4GrtpNLVeRe6I=;
 b=u/QDojQ2Zq7jHw8XIp4FregYBd4P5lR7qp+jxEmaicVCCQqbaMK5UB4rXZzh98+SpT
 G9mq6u3yoxW0+jU67IM5LqRcWAuplld8whVIVp/r6z3V6r0hF8MvnsdDb4Ur8VGqquir
 Bor5Ce0ZZBzbhiLiOI+FLRlv4ZfjaqRrm+7zYCFOaH5bBphQHfOibZuyZXrrHCbAQh5b
 CDBVWBvqHhVIcEY+irPi8mT9UzY2Mbdr0hfzg6OEB6Ia/p6+DTOgrEx3R9gMzPMkszZj
 vFgQ+a0fuQshwHnhcsTf9uPsnhh2y5AXnpEDQhej/JqjuE54W/8wYh0We2LvP+n60CDi
 xFjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxmZ+tkyH1gJKQa7Iiq0MRAZmeNPgzxJqPzJsrp4wAnkuZywrRV1CurTwio1dcyeK80WWeiUfr+Q==@nongnu.org
X-Gm-Message-State: AOJu0YwA0/3QVCqhScfGYwQB2/uC3dK4XNKZ9zolbVHK4DRhh6z55d7H
 zjm6jUxgYWaG16noIP40i0rmo1i7ezJi9530foTugZG3QoDk/oPIsaMEvu+ShYT8PMyODD7q/iQ
 fL4E=
X-Gm-Gg: ASbGncsAEypQAgibMsJZM4wEqsifL+GXylr7J6haPPESak4ERvv/IOky5CnjvxlSI5N
 y54o0+qvTECKKNkFvC24eFtPgb/SgZXyL1irlA5J/6TJ3OUkNtxG4Vkkl9Y4C9l7tN6cErlnkzy
 vgClfYrAgaNUptGhRYLPNHDogoyeff5u7+hhqUXu794a8LTEwUWjl0RD0+utnxMtOOJYSFBQFqE
 YNRoBOLsgbDtCIMATfISN5IJ+4pPGiqkqcRotywucbzg5c70R72A1aPjNY0oYOw/vyUJLm4fvhk
 LP1Vo79aUY0YQequtR6AytPGTp/3
X-Received: by 2002:a05:651c:542:b0:2fa:c185:ac4e with SMTP id
 38308e7fff4ca-2ffde23e3dcmr50857441fa.13.1733136825167; 
 Mon, 02 Dec 2024 02:53:45 -0800 (PST)
Received: from [192.168.210.26] (83.11.10.28.ipv4.supernova.orange.pl.
 [83.11.10.28]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfbb8f38sm13814261fa.20.2024.12.02.02.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 02:53:44 -0800 (PST)
Message-ID: <cd635753-4e2c-42d6-bb7b-d558d90f59d7@linaro.org>
Date: Mon, 2 Dec 2024 11:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: bump default memory size to 2GB
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-arm@nongnu.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20241126084928.252067-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA_SkZ+ew8AAVpBHuw-9YW4S5wFbB0Vqx+dBzXf97JGDGw@mail.gmail.com>
Content-Language: pl-PL, en-GB
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA_SkZ+ew8AAVpBHuw-9YW4S5wFbB0Vqx+dBzXf97JGDGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x233.google.com
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
X-TUID: Ei2zoiaSekYx

W dniu 26.11.2024 o 14:14, Peter Maydell pisze:
> On Tue, 26 Nov 2024 at 08:49, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>>
>> We are working on adding RME support to SBSA Reference Platform.
>> When RME is enabled then RMM (Realm Managment Monitor) takes 1072MB of
>> memory for own use. Which ends with firmware panic on 1GB machine.
> 
> Reasonable change, but isn't it also a bug in the RMM that it
> grabs 1GB of RAM regardless of how much RAM the machine
> actually has?

I think that the goal is "get it working" first and then optimize.
