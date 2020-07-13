Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3143366lfm;
        Mon, 13 Jul 2020 03:22:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHPLwmoAijHcavYEHm7Hr9a0j9OobSodMWsMwvhDenOr7g2zeGYa+wQIT4odbK/nq9Z+08
X-Received: by 2002:a25:138a:: with SMTP id 132mr85105018ybt.334.1594635724148;
        Mon, 13 Jul 2020 03:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594635724; cv=none;
        d=google.com; s=arc-20160816;
        b=tAGjYJhBQNwI1BIm/gJGaBsTvFVKAKGkyXsBJNr7zFiJyPYTCnaiJun7ctBYQpM89B
         bZCWkpGlY/dznAWkh8G2Rwtzbswe5LvRCeFdcUYZ3n9K60s00CPqfXAaCY9q947A9Dwp
         Br3i7CpwpiS5dlxT+wfUdb+sJd5RrY+8eAcKg5Nvf78F4DP1LhvNkSRA/OuZOlolioBZ
         bO4GzLX5cshZKwSW8OX+Yr2ltC1BZysYCwraW1P/odn9vWW8frQRZ6iIFwUPVcDJXJ0/
         SjrMldsRdPXbaaQuixqrwpWNuZ5m473+Qd0s6G8aQyZwFnBSQSWcUXwtWQ4MEIFX2AZw
         SwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ew0LjgKxer7dMgC7YCWEb0Y+JHoLrJwh3azB8gzNQDI=;
        b=GLbGWFZ6qDFTK65rbzb3u1n/cQ0fwf1sZq8X04+j0ji3bDWGnPRNWHLjeos1xvPtXh
         RI5zCvF2agq/mZG2i3VriNjAMJPW7Dq1VEYbEmx1h93UIqKhi3cVnZyVyEhdEzCRfXkO
         XYKEEHnf7wmVtoJGl+j2h5glh5NvroDBsBvHnsqajhlAGoHS8khIsJe37lbLByU1bouv
         d80If/jG1ceNBW+mZ0G1Q9m4PTuvngoUZ6s6q+LyzM6AXOqBO0nLlyI3ocpdFtgNoZJ6
         NpGH4ojJNDjgOtFBsm+XyF0qZbLql9KulbIiY+Nvwj19tkd+3LNUNRv+lrHEVlokMUIt
         6Zmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O0rTd40i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si14354092ybp.39.2020.07.13.03.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 03:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O0rTd40i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juvb1-0003c5-IK
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 06:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1juvav-0003bv-1y; Mon, 13 Jul 2020 06:21:57 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1juvat-0006j4-KP; Mon, 13 Jul 2020 06:21:56 -0400
Received: by mail-ed1-x542.google.com with SMTP id n2so12926174edr.5;
 Mon, 13 Jul 2020 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ew0LjgKxer7dMgC7YCWEb0Y+JHoLrJwh3azB8gzNQDI=;
 b=O0rTd40iYT+XrcUDZAjopzJ0O9Wv/k8PhITw7omLxOtBDxoXECxEZDUxpFVbnQsEtd
 K0F1LhvpGixWcdzW0ysB6ezG9ERkX2Bn2xXuf4ta/DhC3SurFOPrMDyQUQC9pAcNq64H
 mN23x5tWEvposfmcrRMPUhd/XecCEbngM+Ttk4XST9jY/vinNp3SfJ6CqPsQsasLuKB5
 Y2E3yQJ4ULl1B3vZMI3jSa5o1W62v7KZL30yLHpEYxlqW1sZleVMnmXDbPQdlY8Dd+I2
 UIsbVX4B6Og7vRgExjp/2tiJmp58o7zTNX752lC8oHRya0xOcju/GKdP7sWXf83NVwfY
 rpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ew0LjgKxer7dMgC7YCWEb0Y+JHoLrJwh3azB8gzNQDI=;
 b=dus7NT1rljb4DC8acSnx1wIskJb+ev3B+tK6huvH7OuILLGfZzENin4kAz55c0AV7J
 fJdYmlg6G14yfYBpaJfjngyG/5JnzhIReEFccyFgn+baoO7XkJH/T/ITYu1x1HQ6TOJw
 u5ojQlBjfD3kvVboDTzuDfIK0fka/NYfp0Nf1g4wk+Q+nRzIHk9F70SA8/xI14Y2AvyS
 Ou+dspf21DtH/EiTa4Nh8kjitPBtpBzwDPNI/J79Ds+oOsRqPfGCoz4D52KnLWIYBUJD
 FEsU9C2tLouq0zmC+OHHQKsVtOkWEG+tQQpBsMvQ0BjuWlIXLc7/msKMkWRlw/2qhYnv
 p3qw==
X-Gm-Message-State: AOAM532L+MfipPFelUicR4ZhQRIV6jQ8ojyQNJ8T7SDFP8TNtE9K6eVv
 UK5YUySj+Cm5TEdJsPSfsrc=
X-Received: by 2002:a05:6402:742:: with SMTP id
 p2mr69106542edy.135.1594635713807; 
 Mon, 13 Jul 2020 03:21:53 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id q6sm3385641ejn.30.2020.07.13.03.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 03:21:53 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/arm/palm.c: Encapsulate misc GPIO handling in a
 device
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200628214230.2592-1-peter.maydell@linaro.org>
 <20200628214230.2592-3-peter.maydell@linaro.org>
 <4c049b0c-f305-729a-748d-0a7742b496ed@amsat.org>
 <CAFEAcA_JCSs6BCCw-MYOO8RcyXQ_iNZ63KjuwqEPM7yuvWsdTA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c9fe0637-9870-b155-3b50-0da3f03d279f@amsat.org>
Date: Mon, 13 Jul 2020 12:21:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_JCSs6BCCw-MYOO8RcyXQ_iNZ63KjuwqEPM7yuvWsdTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: emdRGzFCQLw+

On 7/13/20 12:05 PM, Peter Maydell wrote:
> On Mon, 13 Jul 2020 at 09:57, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Why not make it a generic container in the MachineState and create
>> the container in hw/core/machine.c::machine_initfn()?
> 
> I don't think we create containers like that for any other
> machine, do we?

No but maybe we could. Most boards have some GPIO/LED/reset switch
button. Do all machines have a NUMA memory device? Do all machines
have a dtb? Do all machines use NVDIMM devices? I think we have
more machines using GPIOs than machine using NVDIMM. Anyway I don't
mind, I was just trying to figure where this container belong on QOM.
