Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp877764lfm;
        Wed, 15 Apr 2020 11:27:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypKlQogWjLqH6WlNjrV/XljLzm6m1Zcz1BN7Mc302qLFAhpDiqDNJxdJGzCCZb2jafESVPvD
X-Received: by 2002:a37:7043:: with SMTP id l64mr25188676qkc.78.1586975234161;
        Wed, 15 Apr 2020 11:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586975234; cv=none;
        d=google.com; s=arc-20160816;
        b=s45MziTCKRfWpm+pSB9FEYSTC67QeiK49JAk0b6dRe9dqp+gM6d61fbGQ7DiUuEe/s
         GlIjhgJ82F0yyimHWv9r8ZZ++Lo0C1XgCts/IbidUozSVLbgLZ0zsIEXaEt/dct4jD0i
         e8AJaKEczdyP5ZjqyQSkTav8p/zYU1vq3YHdbtmVN/YUAtVoE9W4usCO5RnE17GUtRYx
         p52eruJPAxKSY7NajU5lJktrN9m1Dq81guvL5WeM6CmW4CJqzP0kNWP/6TxfNmo/RAPm
         r4rICy2pilr2UqvmWgOehyG7FqX9/YYFdNXxwwiOn8+xf0ShlvqHC7IwQUheHn7bjA3I
         70vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CbAen7WReLndSfTteGisi+hakBd2OC9MJQKW6ybIuAg=;
        b=Yw86XhfMcncEzQl//GvzJOihdGWa2H6J5PSXEMxPhphcYTxSNkFagZcTZk7pgDr9Jf
         uD4HBGr1vWusPxQaAZ6t6I4DY2U8LPJZ8QoYhATe/szAfO+0zZA2asLTD1TOJb/n6Y84
         SGt+/ZnBeNKDZ70AiUXyZWve93t4FMYthbCIyXlXDE3RNZTpMLaIFeoiViJCOPo4YCwP
         QqDlk12MHTZDucy/zyuCCwf6WqNssf4yLfDf3uaRI9nlGBV913PzL0pMMrRD/7kUyZiB
         uXmITllbaNRkEywTB7hzWnWSqf2OPOC/Xz2+ad1xO7beE2Cg8/0kV2aN5DsWv6g0BBAf
         BCFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mnj7nTQg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w135si10165866qkb.330.2020.04.15.11.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 11:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mnj7nTQg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOmkj-0008K2-J7
	for alex.bennee@linaro.org; Wed, 15 Apr 2020 14:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jOmjA-0007iv-KR
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 14:25:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jOmj9-0005oV-CT
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 14:25:36 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36570)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jOmj9-0005nj-52
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 14:25:35 -0400
Received: by mail-pg1-x541.google.com with SMTP id c23so329019pgj.3
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CbAen7WReLndSfTteGisi+hakBd2OC9MJQKW6ybIuAg=;
 b=mnj7nTQg4mnrJHUZeDP+fz7g1YLUPhGL1Ix3BLtEst9VP70hBKB1NHKC16bgF2UnvK
 oxBNrphPVo66S1LVJtEAwLnfu1wb0B8YA4BXUeNv+rZuAqcik/PJXlhozr7EwtfDYbnq
 RwXixuXVlFfLREtuQPcHbrkeEORnUkQMO/9GXLAFUfx0Jf9M4f5wxIhIkGmxH9DI8jIg
 ofMAyo0TikoeRuz66VoJL+u1aE0wrjzy6gNE8MCV1Sl8gOvKISgiXpBZXRZ5+SWuTG+F
 nfYzoKnHY+lQCZBgTTkWue7Y+tRMueX/gUPmGYeH79AdY8T5UuwvpIHuUM5zMTPNA9po
 EQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CbAen7WReLndSfTteGisi+hakBd2OC9MJQKW6ybIuAg=;
 b=RxsZPIQULfWu7O4a/Mjf214Oi/h7hv+AemH/TSKL7UBZN2AtRNZyo2FSdafOBzM8GF
 vXYq6NOySV2S+vtaXJy7/IGQBCksO861lfCXjlExvMqzhnPsdfXgvv1azPYK6Olb4qJX
 oQ990d9MR1+dzg0KHfjzVFraesIfajF+43ga1hnRdIJpMwEIMJYEfHn3kfJpUKPbqxA6
 y5tFumexgxJmAffc98YWUi4ZdklUzvh6SCTAWlrC/HPgF8l5WKj3ax263G01P4APIEPm
 VGNzdPRRyAd9HQnFmf6cIlHb5W0VofcyOtYI2Vn/MN6lmqPgXkiuudd1EuNye6OBZKPV
 6frw==
X-Gm-Message-State: AGi0PubTj0Cu0SArNhb0yzuWE+vsR/PgQ3/8boTwi2G241j4Iom/gyxe
 RLJQkct9RY1CJoiixX0SymJTUg==
X-Received: by 2002:a63:1562:: with SMTP id 34mr3183849pgv.150.1586975134020; 
 Wed, 15 Apr 2020 11:25:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 203sm14655806pfw.25.2020.04.15.11.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 11:25:33 -0700 (PDT)
Subject: Re: [PATCH v4] target/arm: Implement SVE2 MATCH, NMATCH
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200415145915.2859-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec4c6c82-203b-ea09-8cf7-fa2148716555@linaro.org>
Date: Wed, 15 Apr 2020 11:25:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415145915.2859-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: krGvAT3AXRy2

On 4/15/20 7:59 AM, Stephen Long wrote:
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---
> Whoops, forgot to complete the comment for do_match2()
> 
>  target/arm/helper-sve.h    | 10 +++++++
>  target/arm/sve.decode      |  5 ++++
>  target/arm/sve_helper.c    | 59 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 22 ++++++++++++++
>  4 files changed, 96 insertions(+)

Thanks.  Added to my sve2 branch.


r~
