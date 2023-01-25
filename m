Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp474ejc;
        Tue, 24 Jan 2023 16:15:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsRsyfhh7TYfSWknHRcaNOKdLRDy4rhzBzMzs6EGaKVTQrTdMJFb1Wf6xJWOYGxJ6VR28He
X-Received: by 2002:ac8:5184:0:b0:3b6:46ee:16f8 with SMTP id c4-20020ac85184000000b003b646ee16f8mr44987286qtn.49.1674605753766;
        Tue, 24 Jan 2023 16:15:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674605753; cv=none;
        d=google.com; s=arc-20160816;
        b=W1b5/+da26p5HfGc1rq6j+ukaGoslRFk4OdJvBPFmQT0UJyN3dqKFD+BlovzjhP1q6
         4KFXH3SY4yPK8JOypM3OVDqEK1mYLzCCmOxWGgkrR6u7kRKiIBlOyM7IUUOByxBEuzTA
         XJsytwdWrwshf30e5lQwoVEMjUUoJjJlfRW/Kz9IItx2F6IIHE3v2XMfoLUZ5yml+Y82
         XzIH7a1upccC30DEYiqgjsMpEk9gO8BiYfgH/2uSVo+nNmPBATC92JLs7sWZFuBa88Yw
         cTh7QmbQBvLgq8aT3u6W9f3kvUX6rtBlr+R8jR6mkNJWAx7w/DtVfRtVHI9z1/WLbDps
         0thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YvAUAuPefvq93qi8xVXi2xMNh837rKxIRfP/eguUwdw=;
        b=AkYql3pTDwl8JCzOePYdjgE0D1qBVJgs615FI/c9UHXpiTiak0xPrgnHVsNRzW4y0Q
         pxXQeIOS7UzHJZVYY3hPwUjKRqltN6hcuDb8YcyhIPoU1fpz0MCIjTgWanxB8/AWZUmQ
         ERczVwzT44OfBPKYpPjKVBkbIBe4Y+5RYATowDM/zKDyHgdh/MDMvKsxItH2Uq6l9xZ9
         Thrg2x5OvrnaA5lxHYYCcg6nFHIjJbcFzQgYzqo0Ol9qjUxz1gLUi9paTHB5O9pXgM0I
         RcDQ91+aw3oOKMZ/CM1SqG+fXIzeKvGmKb2BQyTRuVAB0pBXQeMeyr5KgRV04uMZLnuO
         FHNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwna8SOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m25-20020ac866d9000000b003b344718afdsi2416763qtp.638.2023.01.24.16.15.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jan 2023 16:15:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwna8SOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKTS4-0004Qv-4a; Tue, 24 Jan 2023 19:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTS2-0004Qf-Kn
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 19:15:42 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTS1-0003A8-5L
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 19:15:42 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so1673947wmq.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 16:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YvAUAuPefvq93qi8xVXi2xMNh837rKxIRfP/eguUwdw=;
 b=nwna8SOEF8H0EVIRHnag1iypfA3un/mqUKSBAtIkrzwf7RESnc8GhWAV9yiXRfTGb2
 GWhlHyhShXT/RDhNBuxRuJnEvLipUMni/vO4lMp3Y1f/90ce1wnwCWXsP9Xr5R/KIx6N
 qDe955jikl1NudipMUyTPaq8l83Lwl/b7811Vf4zYFZcbZ76fLwBaFD/toYR6ioXHUu/
 mx3PCBkzKRMwH1z/q1n2bzLARLaQPA+csJI5OyDwI5rzxcI9yNfRYuubtz9e5zQ+Nut5
 C8Mblpe4KRnCYIeYX6fviZqcTMysv0vqtRDjWd3uNqRDAqhcPOiPHRdVjZ3ZW82VkOux
 5YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YvAUAuPefvq93qi8xVXi2xMNh837rKxIRfP/eguUwdw=;
 b=Icj4A1g0T1y8opufKjAMMd4ajQvzlKdP81rtEKkh4xS9Yesb0JKJ3VnPV7KbwINsDS
 FsGHBax+1IhKvTwq3SWfypZU+vMrx9CYN4wyObuevdQy3eTw1271JGDHW0+PRXWaTfRu
 jvPPXPlqTQy1Qtjswdf8Lpmcv88k+cqDh7cFIrcwx9e2bulnBM9vuksMSnNc4FcCkg+c
 JbIYWSVpr7cuo0Aadl5aisa+QjtbuCFPTGOWonRokpgWD2Ol5bsZgnylRAGLJU8TE1Qs
 3OaU7xDlY1GuSC7XhAyYVoLMHIBD1L3xXPpvHZuBYgFifwm3xMjegVi4yhbJ5ZOwJEXE
 kdpA==
X-Gm-Message-State: AFqh2kphTAUTb1X44jzEI7R7S8ml/CLTlgmOvgfxaf4lsC39vr/XaWIL
 fiRMgAHKCNmq6hhPkN+3UivfzsEjoDkc+K/Av7I=
X-Received: by 2002:a05:600c:4f42:b0:3db:30c3:ed83 with SMTP id
 m2-20020a05600c4f4200b003db30c3ed83mr17280247wmq.28.1674605739839; 
 Tue, 24 Jan 2023 16:15:39 -0800 (PST)
Received: from [192.168.0.114] ([196.89.153.183])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c431600b003d99da8d30asm187321wme.46.2023.01.24.16.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 16:15:39 -0800 (PST)
Message-ID: <7a9923de-7311-5492-d65f-9982ce7903e9@linaro.org>
Date: Wed, 25 Jan 2023 01:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/arm: Use TYPE_ARM_SMMUV3
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230124232059.4017615-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124232059.4017615-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kRoUig11W8Q7

On 25/1/23 00:20, Richard Henderson wrote:
> Use the macro instead of two explicit string literals.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/sbsa-ref.c | 3 ++-
>   hw/arm/virt.c     | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

