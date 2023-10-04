Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2843668ejb;
        Wed, 4 Oct 2023 11:16:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsg5E5xnYEi5h8I/pJimn1Etws3QFOgebrGpk4nNqevjdPvD21Y1/rtvCQCoOeAlJFtvUl
X-Received: by 2002:a05:6102:303c:b0:452:5d70:7cc0 with SMTP id v28-20020a056102303c00b004525d707cc0mr2246833vsa.33.1696443372935;
        Wed, 04 Oct 2023 11:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696443372; cv=none;
        d=google.com; s=arc-20160816;
        b=C5c/43rdL0gThL5kV+hbDfCa/99t0ed7MoveeDa93laNAfCOVSnYW3SDkCYS3kLTF0
         pOHaTtrACArKvqFj9sRf/JreONvSqKYc3IBis19g4hJFVhl7eIx5Z/aCqeFWpbEWjUH1
         O/O2C58h6iz9vtEvxt+Q4czG2TH25/zH3/upPRvv+Vcr/ULyuzdBD+iKcUN0+ucvZKFo
         Wp04q8dh56LLr7IcYGRaRK5l2Bg/XGd/PvRLcWkmx23neWDZi8L4+bBi/PFpr7fMQ6kJ
         kiYaGippsZnq1tkHj9tRU5VFjZ/jfNinW7Ks83/7Os7g5PY2pyIajODMIid4kHs4WsBq
         6Xew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=iZdeQOwpAjNhw7qtpgYcUXCh3y1KKQKJaqogrumSLGU=;
        fh=rfHA4AiGvV1eqUu78ZRvgUtajTrQF7dPJ0dmo8QqEDY=;
        b=AtEjq3TGbiTvV/vDAkRTPqvXL8FAmqmzK7q9R+NRgN52CACzv4tlcfBsMTimV4l1Xb
         29Cpr4nFpkZWPkP3JqfUYKe7UCCkGcE0NPp+bmcVR46r2nyCOxF/hXCceBPafp5AUt2a
         76e0zSYWRPUgdjSUdu4mIVYbr+rze2Zc5RebCSY/TRY4/BeM0ScYFHrVp1rv5KpAHfOC
         Ekl3hr8A1Wd4rAUPPIceeUlz/FeASuSPZDLZsPaKy6XKRMjQPJXUvaYnK+xjmq3zuBnm
         +EQkW3kZ5X4Vvr2f4g5t2O74s9hdbk+RGGL8rHc+WawanPiNDH1vN1JdtsJYh3/06sz0
         sVCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h3FGPw1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020ac84e46000000b004199dd362ffsi1741656qtw.402.2023.10.04.11.16.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 11:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h3FGPw1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo6Pc-00078A-DD; Wed, 04 Oct 2023 14:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qo6PJ-0006pd-Dc
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 14:15:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qo6PF-0007vD-Vt
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 14:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696443333;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZdeQOwpAjNhw7qtpgYcUXCh3y1KKQKJaqogrumSLGU=;
 b=h3FGPw1uaWnnRsO6SDpfqtuPXwUGgoLY3HDNw41i7hMtA3hhoKjn8dqOB8hG8nFF4m7RSX
 EWD2kkMlUzzCoJqB09jdFCb9jJwq1Y/BQig+n04l1Pq0MyipZ6XHmNDvziQaGs7Yzeu5se
 x8UEbRTcAMojIIRessdLoxtCuz6dmbg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-oZfVqu_nOmeKl3Wi9V8V-A-1; Wed, 04 Oct 2023 14:15:31 -0400
X-MC-Unique: oZfVqu_nOmeKl3Wi9V8V-A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4053d832d51so1143095e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 11:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696443330; x=1697048130;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iZdeQOwpAjNhw7qtpgYcUXCh3y1KKQKJaqogrumSLGU=;
 b=deXfRrFL9TeR6ASKhUcb1WQ4DgO7YB9eeZ+MnsKUC7s1otDWIQQd2aQNK2DXKada0T
 59q9tuXZ1MhpgB3l/QgMN/pN0ZZcDrpRIVZmbgxszxHptx0o5gFKzxoG4157NmA5ZzwV
 yZYlFZR6SjuQal51eMdVMMaXWRG1DUJofTKoqrLFZFW78cLJY3yaf82Ki3RTY9N/EVkd
 U0JmDrI/5tKtx+ZWI6NZC5r6dceDUVwvuqVZ1ZNdqgDt58rnaORda5QmY2FRiUbZYKMc
 Eb4wh6xFYy4kP9v8X4pTneZbdisjXJ6POedzHRfMQZ0NYhFLFueUorxwCz8irWoezbzs
 v7+A==
X-Gm-Message-State: AOJu0YyoKFsbUeRpE3ZLfWOGe6Ia/O9pIX3KmpK6Jel7o2JX0c6orynw
 j6GMCR4eT6k0dMvzwyBwdYOYQytWlZJaz3qnoJZwRQU+iX7d57wiiJ3wXzGVR4KW1Tpi7Iz484t
 VbgDRsET5nHCl
X-Received: by 2002:a05:600c:2195:b0:406:53aa:7a5f with SMTP id
 e21-20020a05600c219500b0040653aa7a5fmr2887168wme.10.1696443330707; 
 Wed, 04 Oct 2023 11:15:30 -0700 (PDT)
X-Received: by 2002:a05:600c:2195:b0:406:53aa:7a5f with SMTP id
 e21-20020a05600c219500b0040653aa7a5fmr2887140wme.10.1696443330361; 
 Wed, 04 Oct 2023 11:15:30 -0700 (PDT)
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net.
 [188.85.150.151]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfcc89000000b00326028b4dd5sm4537759wrj.113.2023.10.04.11.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 11:15:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,  Fam Zheng <fam@euphon.net>,  Kevin Wolf
 <kwolf@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,  =?utf-8?Q?Marc-And?=
 =?utf-8?Q?r=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Peter Xu <peterx@redhat.com>,  Leonardo
 Bras <leobras@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 13/21] qapi: Inline and remove QERR_IO_ERROR definition
In-Reply-To: <20231004173158.42591-14-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 4 Oct 2023 19:31:48
 +0200")
References: <20231004173158.42591-1-philmd@linaro.org>
 <20231004173158.42591-14-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Date: Wed, 04 Oct 2023 20:15:28 +0200
Message-ID: <87wmw2qmnz.fsf@secure.mitica>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: XznDcoR3UcLP

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Address the comment added in commit 4629ed1e98
> ("qerror: Finally unused, clean up"), from 2015:
>
>   /*
>    * These macros will go away, please don't use
>    * in new code, and do not add new ones!
>    */
>
> Mechanical transformation using:
>
>   $ sed -i -e 's/QERR_IO_ERROR/"An IO error has occurred"/' \
>     $(git grep -wl QERR_IO_ERROR)
>
> then manually removing the definition in include/qapi/qmp/qerror.h.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

