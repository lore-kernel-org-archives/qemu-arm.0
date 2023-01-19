Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp622564ejc;
        Thu, 19 Jan 2023 13:09:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtndL5xPGh1hBsfstWlvtcfOTv3vF9wWCBnyWlE29Z3v7JbcS2ZaIHLxqUNRnFuQ7HcRqf/
X-Received: by 2002:a81:85c6:0:b0:4eb:2b95:a287 with SMTP id v189-20020a8185c6000000b004eb2b95a287mr12854088ywf.12.1674162542505;
        Thu, 19 Jan 2023 13:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674162542; cv=none;
        d=google.com; s=arc-20160816;
        b=T8j4rjMWbSDYgPB9Zg0G+CoXedCoP64Y/Wsng5gauUkOsBE2uNrTpMS+rMCPq1xgS+
         w+MRv09RHrBE1vzGiyUeMC9BRU7JototQwvkCXZM9ANA/N2Rvpk3xMYgMqarHzk+cInb
         Qwp1ar3te1Ttgu+W8N2NefLcfOYUpl5912N0cIKabp8QAMSR7OR4+z0evQE/W49cn58M
         MdS7cL13R3ZXTgrc7S91DaEy3YWgu8zimqQ8UrvMLJ4FCxN8vbTP8MFosBRX0thTNRGb
         Ymj5SuCEix4wRFbZypszR02NCOKgszoRsR7splIX6XvVD57ehiplBXfaRe3wMn1QWbEt
         mMUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eIgXH0spC70Hi9zgTKqd7JuXULzQuHOHo/pG+EDKQ0A=;
        b=dgCM84xTYYgHuhGasNgxeRHLUzlYmD4ZahPceDIA8MUOZYhjBUBJp91KafwM7cgzlN
         AiE09bQ7yfJ11DnMWf/9X+4CqASWIWYiIz+kyQO24aovc0owv5YTJclDBvdh2MeLCVxV
         Sa+bUBLF3+B1we+2xPt1RvCh29oCbISUV4bKMi4/u29X/uRjne7E0/SGoRfeQIX/cLGx
         bTyYsuvJWX2EDBlxoMwXZfo0FMPc3b2MQ8fkLfx6P0MwfbBN6kNbzYSoQxZ57rb6k3nh
         YHPkENW3e148VFEPhxJ3/4w2tU0dWpMyOpR1Cl2qRtLnbQUwnLRg1DMAKG/QutmZdnFi
         c9XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qpE5OWIM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a05620a424700b007023a700d33si24072517qko.617.2023.01.19.13.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 13:09:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qpE5OWIM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIc9E-0004Cu-7s; Thu, 19 Jan 2023 16:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc99-0004CN-QW
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:08:33 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc96-0004xJ-Ea
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:08:30 -0500
Received: by mail-pf1-x434.google.com with SMTP id c26so2480496pfp.10
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 13:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eIgXH0spC70Hi9zgTKqd7JuXULzQuHOHo/pG+EDKQ0A=;
 b=qpE5OWIMIow7mZitPBB0VGGP54ZrfL3B+8zP/s3tjE6O8c7tNOpdnrGmsSmNLDoK2b
 /BsbiwXLzMm5aWSwse4DTvo+tLCaZkgcJYlw+Jgct4fGY1XLjyQ8zsPiec+4rlm13lXZ
 9f2wIWL6PvUF7kp+6sLx/meVjeL/zSre+AY7Hcs3ZZ45wafLzfDYBSpE6L9VSSdlcqAM
 ofwAqCbembmuzWJ0l1EwelF6g98FQlHO3zIJHdPW60jDUQ8PU2UlKePbwmlsxd4p90vr
 zO2iNrU+PzogU3pUy78fUslojB9s6sOeX8o4SNXzrSNImhEbTOdXGlOBlfJ2bt/Rl1Fz
 CdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eIgXH0spC70Hi9zgTKqd7JuXULzQuHOHo/pG+EDKQ0A=;
 b=GYttLT43JdxvHvllPi7C9WqQrmQ4ydfJaV6ngvc2Gez8EbECeJJIwhhYHzOqOqruSm
 3ljm36TRI3EStkkPykmjY9734WptZwtpXeIj1TtS1e4Z90SNnIK9AjVAgWkRonoyERe0
 tUQnqAowAsXh8qED+CQ7oBpvQAtFihbNdck+Hx8SzJEVbJvMMF1Pwx1TjrqIOqeJ5B6U
 UZzj97Qqmlsx+m4UZnwxw4QiwHHYNHfTIYxIkybPMtuXN5lReY2Hx5iegBgKtoCxX6A2
 ZxqthhPPEF5xjoVW47AXXkOKeRpPrrJ60ZsyLWKBUHhbSJdY0ROojYxsTb/zjDqKGasf
 LNJg==
X-Gm-Message-State: AFqh2krsIzDUqTuK2zjyHqv2L+eYzTBs1KDE5IUfe7E2fxJJdXc3sMXT
 3gzVG2UkqO81PqsiGpj1jOUr+A==
X-Received: by 2002:a62:a507:0:b0:58d:e780:33cd with SMTP id
 v7-20020a62a507000000b0058de78033cdmr7169646pfm.21.1674162507098; 
 Thu, 19 Jan 2023 13:08:27 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 k197-20020a6284ce000000b00574b86040a4sm24563028pfd.3.2023.01.19.13.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:08:26 -0800 (PST)
Message-ID: <f8b054dd-41b3-1f58-4f67-a8093fad785a@linaro.org>
Date: Thu, 19 Jan 2023 11:08:23 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 06/11] tests/qtest/migration-test: Reduce 'cmd_source'
 string scope
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: JASsY2S5etUt

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
