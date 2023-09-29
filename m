Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3041475ejc;
        Thu, 28 Sep 2023 23:29:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv+f3oAacwVaj2NG75jy7PKg8JUJiXcFm+qOp4MdmUQ8YJ6EncPctE6quMKxe/vaC6ZVUp
X-Received: by 2002:a0c:aa5b:0:b0:656:5402:8d09 with SMTP id e27-20020a0caa5b000000b0065654028d09mr3158299qvb.4.1695968943753;
        Thu, 28 Sep 2023 23:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695968943; cv=none;
        d=google.com; s=arc-20160816;
        b=HEvHf1TEoRC9yxx3jsId1GL2X866n7mfKkpsieqzcrEGCIj5nJUOZyTKcynqpwQw1w
         HLXXB9C7awnFKFx23jZlhrpFQNyCHjusbUKXisCO/G7uhaq0L/fMGoBLhndTqTCoks9d
         FXNn0G9lIGl6dXg5or64u+IiSuAPpXsFqr0NaXoftyW5N6yqZuRm5u5pKNhMljxaKERl
         +2XmMV4Lr/CaLLcM099Ho+3PS1TITFn7e6gVWoO+8/l9YrF1gV+AdrKzOVtPYVkcsWCT
         Hf7rCeUGyDIHiDwMmP0Yvj4/CMzlfeOY6jZYkCi5SnJPwwf/UlGhlfxcCCNva6+u2/Up
         d0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wTJXax7k6eaEa5iXZfDdTO02C9VEmGNAsuCxv14PyRA=;
        fh=GUPjxW4fQaT3DFhTiIvwAKlXuS5cVVc6mPehwpozP2E=;
        b=RL8j1w47nCblgYQw0yIwt6YBIPaMdzeDdiRQmGjSXrXxEl0Mlf6pVtXDBJ+nYVD9G7
         79qLRItww+PrMADu7epJtLURz/gUQVRNXJXGBoG0CZzjRD4L/Co3gz4EUGj15Ns1aEHE
         mJeXeJrbC2NUS8V018uGCD2X31Zm66sX0istUXY2tJ3xFUgWMK+ArGOVBqedanMr5Qug
         d1bs+cvWR8nnPIUAKvuoDE3//UJxPAo+zsTotZ6XMHRn/PQkzlq7MBHupXAvQrc6WY+s
         HEg340s3ddam8sWTZtSt0uWmqM4RdRdmHsl9tCmTM3a8aJX9kYdv63jYfLYaCgc0tx/R
         3CeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BelkRTCc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a0cf20c000000b0065b05579206si5482414qvk.371.2023.09.28.23.29.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 23:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BelkRTCc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qm6zc-0008Lp-Hk; Fri, 29 Sep 2023 02:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qm6zb-0008LV-4c
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 02:28:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qm6zZ-00053q-8S
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 02:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695968927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTJXax7k6eaEa5iXZfDdTO02C9VEmGNAsuCxv14PyRA=;
 b=BelkRTCcBx1BB7fxM+sfpBi7b7JL3hTJdOwu+cvGClHw/zdJsceRP0XlUYHT9NJJaqQqWT
 CtcRlFjgCijDl+UV+X3SOuJiLCsa81ctsoWvY1BWWLGP5oYZ0v2dt8wUAbsQ7/WzJvYDgo
 gX80IEUHbrLdax4kKhhsdTfQGdcpo4I=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-n10Cmu9oNsSmPmbzcZKM_g-1; Fri, 29 Sep 2023 02:28:46 -0400
X-MC-Unique: n10Cmu9oNsSmPmbzcZKM_g-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-65af3fd7a55so169511226d6.2
 for <qemu-arm@nongnu.org>; Thu, 28 Sep 2023 23:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695968926; x=1696573726;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wTJXax7k6eaEa5iXZfDdTO02C9VEmGNAsuCxv14PyRA=;
 b=wAjz5Q1moC79nGm8RhhkrcBV3C2H4k99Xdsuxu9CBZhDtoJDniSjQyt79sgi4S8Y5B
 m4mr+fP6CUpXMPDjoooUb+qPlalJHuyd31VqX6rZrdOV8Qzu3ycXoQh1KWZX3P8GnGwE
 7ZTCy0s69f40oN/NPW8z0dowiuicEBkyFnF/IV6foTIeuXx2FBKE8y01BFGzTwN3DfEE
 7dx3QCPAuyZQYNlURQ6hH99u6+SsQpFXKIo9UFVyF4aS8Qbmfpzel0ScQev+52egvIWV
 H6nhzQ66Aw4O8v/81urPTJdb4zs5ns3AiwYa3BAbgSkfSfU3hCso6ejAnTo6/Wy1DhPC
 zVxQ==
X-Gm-Message-State: AOJu0YyabfuLpG7gS3+yCMzaTUd1guW1uEZcdf3cahCPMHHhio+59Vbj
 YZPXQImHmfTJroZy/uSrlGtGtpWT5156dSmtUkmsU1mWLRflxeGhCMlmiPZUPDw2GwzBH3W+A5Y
 2rcB/JWA+JAXc
X-Received: by 2002:a0c:8bc9:0:b0:658:8978:44db with SMTP id
 a9-20020a0c8bc9000000b00658897844dbmr3212420qvc.1.1695968925946; 
 Thu, 28 Sep 2023 23:28:45 -0700 (PDT)
X-Received: by 2002:a0c:8bc9:0:b0:658:8978:44db with SMTP id
 a9-20020a0c8bc9000000b00658897844dbmr3212407qvc.1.1695968925560; 
 Thu, 28 Sep 2023 23:28:45 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-123.web.vodafone.de.
 [109.43.177.123]) by smtp.gmail.com with ESMTPSA id
 c1-20020a0ca9c1000000b006582f94af3asm7253200qvb.44.2023.09.28.23.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 23:28:44 -0700 (PDT)
Message-ID: <5311a1e5-2334-928c-b14c-6dc685d4d2ae@redhat.com>
Date: Fri, 29 Sep 2023 08:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] tests/qtest: Fix npcm7xx_timer-test.c flaky test
To: Chris Rauer <crauer@google.com>, kfting@nuvoton.com, wuhaotsh@google.com, 
 lvivier@redhat.com, pbonzini@redhat.com, stefanha@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230929000831.691559-1-crauer@google.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230929000831.691559-1-crauer@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: wQPmoNxVtHVs

On 29/09/2023 02.08, Chris Rauer wrote:
> npcm7xx_timer-test occasionally fails due to the state of the timers
> from the previous test iteration.  Advancing the clock step after the
> reset resolves this issue.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1897
> Signed-off-by: Chris Rauer <crauer@google.com>
> ---
>   tests/qtest/npcm7xx_timer-test.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer-test.c
> index 43711049ca..58f58c2f71 100644
> --- a/tests/qtest/npcm7xx_timer-test.c
> +++ b/tests/qtest/npcm7xx_timer-test.c
> @@ -465,6 +465,7 @@ static void test_periodic_interrupt(gconstpointer test_data)
>       int i;
>   
>       tim_reset(td);
> +    clock_step_next();
>   
>       tim_write_ticr(td, count);
>       tim_write_tcsr(td, CEN | IE | MODE_PERIODIC | PRESCALE(ps));

Thanks! I'll queue it for my next pull request.

Acked-by: Thomas Huth <thuth@redhat.com>

