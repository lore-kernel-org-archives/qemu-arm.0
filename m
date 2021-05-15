Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1499181lfg;
        Sat, 15 May 2021 12:39:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYEjW31tR6HrsX47hNwR5qB1GcYvsHdGGar4wPhjDRVnydxzYwEBDQA023F5+2VWcntQsB
X-Received: by 2002:a05:6e02:527:: with SMTP id h7mr11825665ils.93.1621107553315;
        Sat, 15 May 2021 12:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621107553; cv=none;
        d=google.com; s=arc-20160816;
        b=fTEMsbtO9SIFZQo1UYuRuAIl5JxsbT4uTaIISV+FpZyPmPn9CgQaamAR4zoCJgufOf
         veeGiBNOM+dvXCq3j0hzRv/QoFAb29xWAsEdDKwQgZ/R3l3vJt/TeCED0159Avvp4bxG
         U5KbR+X93VVQdvOwbywIAM9fuU+LJ57t3EF3GG4XzseMC624EjWleDu69QPlQKtPyATH
         ysv3AJVVTarR8bqVR5ZELcxGFWb4mE+BkEPXzESxVC9Q1qK2gs6Nye6xgsb1GsBN5rsi
         qJEVsZQqvDNTPEyS4Lti07gEJJnF8P4dBxGmerkecPaS1Gfrjle//lvl1gxBAznYUFhx
         Gwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=tmsLF0iBVnWkPeqO0A267j4ncS1FXvkZEXUzCaxN8Ys=;
        b=rtftFrDcrLKJ7DNUdMFAnRIBjRsaHNm86dh3AWX54+cqOAtAXU8qLiHQ0tUs9+D5CP
         pV27jbf7YgrXrmRK+jzm4U9JDy6MRNTCbUskwB5dDZKa2J0sOkL0eXX7AE/edyaNREal
         UQ8sRKqy0rCCXuWtb92P0AQxmc9V9y+koDpfbuKXGpT1G8nUI9eDxJbzdvLAm4sXaPlG
         ibPLznFqFg/539Igd67Jb86SlTkiWhRVA2hdnQikOE1zt6B/R0VNxESHwQNowUBcpLse
         yt9lXifYFBYxUxmIC4iGOksnIBj//ax5UefRqjOh2lLYOkSKS4YrOJK7Py/kZ81koaQD
         83TA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d23si10390399jam.89.2021.05.15.12.39.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 12:39:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1li080-0005J3-MC
	for alex.bennee@linaro.org; Sat, 15 May 2021 15:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li07s-0005IP-Pc; Sat, 15 May 2021 15:39:04 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:54017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li07r-00072b-7K; Sat, 15 May 2021 15:39:04 -0400
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mi2aH-1lDdFV266L-00e6do; Sat, 15 May 2021 21:39:00 +0200
Subject: Re: [PATCH 0/4] linux-user/arm: fpa11 fix and cleanup
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210423165413.338259-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ca091ab4-b657-a336-eccc-57b5cd5d4a46@vivier.eu>
Date: Sat, 15 May 2021 21:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423165413.338259-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kBAMKfbe8bGYGqNnnTwBQZpB06Fga7QVeg+56zchcL6f8m0Cj2s
 9Oqe59+x8EYJYjSPeWpZ9Xi1qApNYxXIbuSJ4QqN4H3wkaJe6jSxzpglbm8gYPlgPB0ARzT
 1XUL7/7xnEj1l+ZCtwhbXV/GfbiEexj+IN/4I/2t2xHKhbCgudb3VZBCpNuiaWo4pcryCoT
 ca6HcSIW3fgGAgbJWFimA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wTe2dBVOnwY=:M7sS4+iQQRwo78us3LdFZZ
 mi0oUlSv52+2ud8+8xs5OPPrafiu9D5s7vfT86engLywHfN38prsMnuKjlUVetW/686Pce97X
 NeW420Mln6RmVFNmlgJqzoxN5keOwZLc+liX4b3ck+yL9IUJ4PIE8lZGgGNzGtzl7srt/1pBP
 bx4ISYFsHg2/E2pISw+z7foNb+xIrEuAEp5hZ6gkOFxkcVDpbql2GshFs2TXajjxMIykJjCbk
 /sVcBGV7X0OlPSu8I2UdzNEz6Bs6/mmsSEXpV0mPlU+dNN2SSJnn6Sibykqb0wK4fyi+4V0Bh
 hs3GHpTKRAYxy8Zw7PwbeUq2VTMOnXmLs7+dFuL11AK19s1KcZ4SoU+ErkRh2us/Q+3UfxZRc
 nk7Ydeoe1TWV6XficMhYf/ZWAgJX70wtIuvAxKZSxf5XPgte75ejJ5LnbODrWxi8cSfx3AvWL
 /VwlCgp3MIPrz5iT6kib5iHxPEw3BKYqI87BAMKsEgkesV1Fq2FoibYNLnG8CBETEtwegpJmy
 6KkM8mF4ZLe5Vgaz5yMa3Y=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zqRjHp4Scxsd

Le 23/04/2021 à 18:54, Richard Henderson a écrit :
> The bug fix is patch 2, the rest is a bit of tidy-up.
> 
> 
> r~
> 
> Richard Henderson (4):
>   linux-user/arm: Split out emulate_arm_fpa11
>   linux-user/arm: Do not emulate fpa11 in thumb mode
>   linux-user/arm: Do not fill in si_code for fpa11 exceptions
>   linux-user/arm: Simplify accumulating and raising fpa11 exceptions
> 
>  linux-user/arm/cpu_loop.c | 125 ++++++++++++++++++++------------------
>  1 file changed, 66 insertions(+), 59 deletions(-)
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent
