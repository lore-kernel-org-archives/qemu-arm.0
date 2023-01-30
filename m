Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp703410ejb;
        Sun, 29 Jan 2023 20:49:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9MH4iAAcH0vg0MeBj+Zo8YokLPbpSuT23UioCz+g4OnedgVecu60fT1LR8BYQn6I4gSs34
X-Received: by 2002:ac8:7d41:0:b0:3b8:525e:15ea with SMTP id h1-20020ac87d41000000b003b8525e15eamr8403400qtb.60.1675054160192;
        Sun, 29 Jan 2023 20:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675054160; cv=none;
        d=google.com; s=arc-20160816;
        b=pjA0u9eZrmh/AK8CZitmETsJJ6I8E3+G6CIK2Zp83ls42cRAlzK7GpB6dIGRaNV5Cl
         OUTl4N+feXKZyKS8FnH9TTu/fxwKCbFpqJL1GuLmmXocG0REG5DCNEU3kpqJgaz8Zz+T
         25wDuby1NA3NeEFnkMFLA73HZzPGvp5w0k1pXiEFUpRQoQ6VeJ32CQ9zYJOIHX+PG1Kl
         q0IntDg2lBIr4LL3knu8ZTAM7W30n4rW9SXoPCSjQIhYwMASK4Ci34Ou35NY/joj07fn
         y2PhSCaQdlZJFO2UEPXdx2/qZ0/Hk2rgo+3h6TJU95nm/WJ5hQjfwcZnhz3EYqAQnW8q
         NqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=EfPiOSf9W73yMRKCkVU0VbjeTsXQlutNmGxZE+NV/JE=;
        b=cLPFgb8IMuwcr25WWTjKcPO7IFL8OzZiMAs2SwxMxcxcswsf0et3lRr/CqcxWsf8m4
         bx3QCnbfwL/6WtnPNPJkJXwxckTUU01lj6mWO26AlaKMGwzgoIDpSt6q9j5AFlxNGNFj
         9yvEuS8YtcL54gBW5N+z6CUqPUGdj7sLkxJtbgXvgQkVOe5uag0Ar4+Vc9WnlK5aWcKC
         XKlR20PHa8DTSmhNtpNjuJ/XbyjAXuh6zO0suJwsqk9dDJ59MjZmXdT0mjDIKOaQ7tIZ
         ipTFLpYLMneME/lHmu0iV/u50dV/H4NeD5mbT3ejZ45Myd+JObXlfNgE1gdLZgyZVlAk
         zJ2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hes7VAHz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l27-20020ac8459b000000b003ae4ac84058si3065615qtn.78.2023.01.29.20.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jan 2023 20:49:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hes7VAHz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMM6O-0005Ih-AN; Sun, 29 Jan 2023 23:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM6M-0005HQ-W1
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM6L-0006L0-J5
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054145;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EfPiOSf9W73yMRKCkVU0VbjeTsXQlutNmGxZE+NV/JE=;
 b=hes7VAHzPTAWOdj+//4bhNB9BbQZKX7pmGuavxvK25rOh+g4q0eUTF39UXCJ1xbqQ+K9XN
 vC7sd/otENyIiylgI8FK4a+CvTaAtCh2g050UEtpr3BP8QxBNhtXUDLlOBUmGNUJd/Hj7x
 S47S+CuPWsVIwOMMzlzi/f9qAO5nWLg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-jlX3dT1-M0OGttb26tuSLQ-1; Sun, 29 Jan 2023 23:49:03 -0500
X-MC-Unique: jlX3dT1-M0OGttb26tuSLQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso245235wms.8
 for <qemu-arm@nongnu.org>; Sun, 29 Jan 2023 20:49:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EfPiOSf9W73yMRKCkVU0VbjeTsXQlutNmGxZE+NV/JE=;
 b=2xRbN7o/w0Xv4Tr/wiZM78DAQRN75rg9yCxx6O0F/Zy75qLW1RCX2BqNOLjz6mkbdI
 ePC/XGjnn6hRTD5/5dAZgxr/w33iJGcX8lS115JqUluQ6rO8zHnyyitq7+TOrUSEHVPN
 UOBzcvnYGWT81XeMPqX76wSnkRBBKwMAsCL8m6uXQ6J68Q/KtCBMXEi2RKgZrFv06tmy
 wWh6BORdEw2flHRXzlOVqvrRNK3SHokasl/493qqG5dfDGp9SLhCJmNBTXI7qa1pFbjM
 SG8IcK2PZP8xqdC4ZnB9SM10L7QlZ2dz9FSOV+S1KL/jvjMLWPVUg6J3sf6kU+RV+U5T
 DmWQ==
X-Gm-Message-State: AO0yUKU7otzNHhRiol2LO/XNPHa618WzkMSMBhIC/JBNiZsssK+vB+7w
 u/V+jZaZyvjCGJzyGuOUe+EYt+ef0gLC4kbWEUd4pQO46olIfCCQCsBqF0vXhsEH9dP8RB5eT6u
 3+WjMf4FdjWOM
X-Received: by 2002:a1c:f014:0:b0:3dc:4318:d00d with SMTP id
 a20-20020a1cf014000000b003dc4318d00dmr8897319wmb.11.1675054142807; 
 Sun, 29 Jan 2023 20:49:02 -0800 (PST)
X-Received: by 2002:a1c:f014:0:b0:3dc:4318:d00d with SMTP id
 a20-20020a1cf014000000b003dc4318d00dmr8897306wmb.11.1675054142612; 
 Sun, 29 Jan 2023 20:49:02 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c08a900b003dc3d9fb09asm8162518wmp.47.2023.01.29.20.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:49:02 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 11/11] tests/qtest/migration-test: Only use available
 accelerators
In-Reply-To: <20230120082341.59913-12-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:41
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-12-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:49:01 +0100
Message-ID: <87o7qglj9e.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J+Z5SMhBcaSn

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> For example, avoid when TCG is disabled:
>
>   $ make check-qtest-aarch64
>   ...
>   20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
>   qemu-system-aarch64: -accel tcg: invalid accelerator tcg
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

