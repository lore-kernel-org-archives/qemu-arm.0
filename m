Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3434110njb;
        Tue, 9 Jul 2024 10:26:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4oyW664cKWVKdPqFTQvU2yQjaWAINDs+Ihw+0+WFgGMBd0WF/NjD8wuA4KooaMr2nvlEpCpcn8GsSoqnPUGMjsm6r0MNO
X-Google-Smtp-Source: AGHT+IFhpxOJ9nbzZ1MyvAOUkihq6sGFB5C8WnRZ/FZ17nD4eKTxhSayZv3fNKD724CeaTvQDmxw
X-Received: by 2002:a05:622a:1184:b0:447:e14a:20a3 with SMTP id d75a77b69052e-447fa93e10amr36601451cf.55.1720545994661;
        Tue, 09 Jul 2024 10:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720545994; cv=none;
        d=google.com; s=arc-20160816;
        b=XI0IJ/tBsIlWJyuNhi6dIbSP8YmtzW87tLlFNQSMqupbp5qs+mfVYjRI1lpIjdcMQh
         P302w69UpXsa7b1mhDuBwKFZ+nbHQ330eNbmiRTXPsIv1v5THht8R32eiEeXfCLbF+oJ
         yPDlosabWJEchy1D/FKvnWPtJopdL/LDyxYHa/L6mwqojFCgsaXn3OuZAMgVCUJeTswX
         iKz7u8eoxZfLcACIMhqD30e2qg1+ec+BZ8GD1j/Fk8ctBM9wA1SopCe5/XVdUMKC1tz/
         jQc55o30kjSWQdiRgNqKzEbd1uB6bVPucwuULQnT5GuQ8AjLikp6+dA6VerH9AhaeiNS
         /7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=1MrsYAq1qM8KidZUR2FHzp/ftNr2vcU51EyVfTZMdh0=;
        fh=2yPNHwlTqXPkf7aEXtSdid2jyxp1RRcgPZeAwRW/QuM=;
        b=Xo39gOBEShbKqQzbbvD67TYwnjV+/7oi8KUjjEyvdOnc5LrJZwhQs1CEJm03xfZVHC
         Yt6ODQIsndpIMd8YADXYLT0ay3icdpDZW8ZsX4rzBfI7TwDLUGvAMbtNHWRTzXI1nJm6
         7QU0m1B2+QCQiWunVbN3oQmevn3JY0oqDhxU86AaCv/uyb4NE8ebUW3wVPmZNyqT82Ld
         LhsV4nQMb8yqDb62uoIn5YufiqvRy0mr2ISL2pghpOFW6LHfqsj3kQQEYyVZqT1nMqXE
         +20AkYK5b3X8eL9RNvD30Ah8B5QqZiEVTXWhC5Ay8C7ZvDPPn+mdEpP9kkxJrCTW2t0S
         qoag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U1oQK29C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447fa49a794si25210411cf.242.2024.07.09.10.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 10:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U1oQK29C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sREbd-0004kF-HO; Tue, 09 Jul 2024 13:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sREbc-0004j1-51
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 13:26:20 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sREbY-0003Jl-5Y
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 13:26:19 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1fb8781ef1bso16132535ad.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 10:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720545974; x=1721150774; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1MrsYAq1qM8KidZUR2FHzp/ftNr2vcU51EyVfTZMdh0=;
 b=U1oQK29C+Y79/xpQmTEaiaQKelN1Nu4gYGSaLzF+54kpCRkHbfYQftXGFX+Toy33Hn
 xverdG8GOGvkkAiTDGgiy6QRLF0Abo6Y10DzK3nNrz26hLvcDa1SfZj77KuaQpqY20uf
 SwMOQqP5n8juZZ/cErodaPs6DHdDKv3W8Pz1OjefywqIeQbkR3IwKOo00hw+TDWDJKbc
 7zfxnn9FG7c2vzy+Wzws1BR2hfuluQxIwQQ8IRfMQegQtqBdwSUUl/iYy8GAM/b82TpI
 niL+qhj+H7z0B1PwhMyKmKOGUnreWJY2GMQRUg/nA8FaV0+Crmr83v2iHJCyA7lILIgv
 jsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720545974; x=1721150774;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1MrsYAq1qM8KidZUR2FHzp/ftNr2vcU51EyVfTZMdh0=;
 b=dXces0zfI1Ymefv9Mh6k0X3LNhrTCvnsqLBTwrAJNb6sdfIhtgApeQrWtp/MRKOmow
 u9x8huljFrRAdfKhMgy2Sa+TAX3L7rkZOG2V5Rx+Bfb4p6Ylmb/vij7cLMyTEZI0vBty
 Hb/gVJAbWv8TB1/i2B+EAm0fbNFn4NDsZrb4TdhMqkIBThfTQCqbdvqTa3dISSSFYUIr
 hZebcu4GFpkl7h9tEAfv4R6t5Vd5mDUxqt7G//s1tospgZ8ApzRPXBWfSmqBqfHGgJ/C
 gzN2tZXoLk2feUGW98z7ep8Ia9sXTv0Uk88H91Z8jOqTG3cwBCgOwsBdCucFCtQEgPsH
 s4wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU68tRE8Ye+kdmeN/w9PG4WITa9zgSNvIoJHxVqpe7lkNcloFK8ddlFDZ0SuNFY/FBK5cjYee+3EifJtWA0mcMjgyPz
X-Gm-Message-State: AOJu0Yw7Sp+1qsYs62EYTEzfpGkmQYKNeCPjqiDLyRGuNebWgMmbWsTI
 0/2VDD3QxzRM/58XOJhIhJPznhx2bivczh/Gir9g92LSiRocJsz3cNtGic60zrI=
X-Received: by 2002:a17:902:e80d:b0:1fb:93e6:94a3 with SMTP id
 d9443c01a7336-1fbb6d03da9mr25343525ad.18.1720545974395; 
 Tue, 09 Jul 2024 10:26:14 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab79d0sm18653375ad.174.2024.07.09.10.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 10:26:13 -0700 (PDT)
Message-ID: <6af43b0e-d417-4980-9afd-219ad52e3a22@linaro.org>
Date: Tue, 9 Jul 2024 10:26:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 0/8] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240709115228.798904-1-clg@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240709115228.798904-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: CHSLC1Fmn0mI

On 7/9/24 04:52, Cédric Le Goater wrote:
> The following changes since commit 44b7329de469c121555a1acf9b288f3ae71b8e61:
> 
>    Merge tag 'pull-qapi-2024-07-06' ofhttps://repo.or.cz/qemu/armbru  into staging (2024-07-07 13:23:28 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/  tags/pull-aspeed-20240709
> 
> for you to fetch changes up to d847ea7cfc6321e2519f587d4077428d90557178:
> 
>    machine_aspeed.py: update to test network for AST2700 (2024-07-09 08:05:44 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * support AST2700 network

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/9.1 as appropriate.

r~
