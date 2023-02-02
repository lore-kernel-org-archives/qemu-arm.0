Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp266915ejb;
        Thu, 2 Feb 2023 02:55:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9km0R0ctZMVfI1/i+9t5y4J9m7vazj4PSfvQw+PHNgABAy2v0EktMVm8waPhsPdnfW8Gi2
X-Received: by 2002:ac8:5dc6:0:b0:3b6:316e:90c1 with SMTP id e6-20020ac85dc6000000b003b6316e90c1mr11187034qtx.10.1675335323096;
        Thu, 02 Feb 2023 02:55:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675335323; cv=none;
        d=google.com; s=arc-20160816;
        b=q8FLZN6jn7mYg2urL7vIb+tbddlBtcjAMYMPzE8pt8vZm6mpGpefwdVP6hsBNtivsF
         3DTWsdBj832EhszkNL+iQrNw4bMRXCzTH2vNgFG2iWeTR5dMXjiDmDzcLkfWsnzY1zUD
         QZMpXQcZFj287u4p1SLWo6P2QZr0Qe1MNMXN473QEnKvzwBkZhDKwDs+XUO8/RVnJkIf
         +fbyIn9dt6rSo8Tr+t3Xv4biE+TDb3aIoEwEoTiz5CujepyArpknWgj9Zak1yxMTw+Nw
         UH8tC7vC4e+vmqFCrUYbq+kzjSPKqkZmoshS1+aN05Y2E8AnDxralt3Wk/mVOzuJunJZ
         9JLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=NLSAVDoZylH9Kgdm2kdmt4N6jPXJUGvaGdKnV+wEGHI=;
        b=OlERElDa4hO+lemZVp/EQFH+ppXHWu4l6KgXNYGBu+8v1GQ1vk0mhXPqbw6LO/Jo5L
         F98yNu72Hr553nvPGVNnESidq2MttTbZWRPlbxHOSbwihh7H8z6Yob8qHmEZqWbMkX/I
         9xl6GXVA3hgF/2mABIGhx/xPCLnNisrhrKNYozM8IHAJ41/6Rn+pRsbVqANMtwTTM4nq
         DBQMdN1f1ERYTPC4jlOZDsl0vF292KV0uL+tgiNux76sfR1mkKrNoljJl2uapRgHMumW
         /JuuJ6exVJ8WPTDoxhEwQpRpegLEWm+GzqNjn2EbWXLcCrAngajfJUItX1E0wOzEOMkW
         eOjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dIy1xYHN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020a05622a058900b003b9bd67720bsi1947807qtb.398.2023.02.02.02.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 02:55:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dIy1xYHN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNXFB-0000oD-2b; Thu, 02 Feb 2023 05:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXF7-0000nL-0V
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 05:55:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXF5-0003Yv-E1
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 05:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675335298;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NLSAVDoZylH9Kgdm2kdmt4N6jPXJUGvaGdKnV+wEGHI=;
 b=dIy1xYHNwXtGsSZkWo1rlcEFwXDNyk7lkzJjyMBTYbpjcpfnapQ1J8FEjKxCnE2W82kuIX
 xwADeXtLiqT6S8v230U9oVbfmFRhSo24x6jnb7+QBm06lRUFkStfY/XgW7toAhQIRMzkJf
 Be9jpUqJLjMdtV8M5iRikTfnIb4y33M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-68-meGmPd80Pq6Z7T3zed8aqQ-1; Thu, 02 Feb 2023 05:54:57 -0500
X-MC-Unique: meGmPd80Pq6Z7T3zed8aqQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 d18-20020a05600c34d200b003df901ab982so804789wmq.4
 for <qemu-arm@nongnu.org>; Thu, 02 Feb 2023 02:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NLSAVDoZylH9Kgdm2kdmt4N6jPXJUGvaGdKnV+wEGHI=;
 b=Q9uM0Opc6R5GjFnnRXQs8335YYjn1AUeAqf1X7sFF4dvvhFm5bCUyr2RZqI37qK0sU
 2GHXKrPmQoceWopwASYf2UE1phUN/aCbrXfLMBCxa3XBylOq9TPXlNRnnKh3Oh1vOD31
 7p7S0T7rb2nCFOY0tGv636dAfyXOCcLBPRfMDJRZ6usXysEg0NsGEncOSoRPnkDcKwez
 2NNQkqDaULQ+pnsJMIfSrjMV1UtztRs5jyjs+y01+qM3+ZXC/mTJRczHDjOipdGRSYis
 xWLuEHBot555QFZjR/sh2riNOC1rpm8uyX/zCR4doHtzUM/7GYaJspBYk7bXO91a/0+f
 Ep+w==
X-Gm-Message-State: AO0yUKVSZYtUFaBzzr+yHN0mT+vqp6HgrVU3gHQYk0mYcKnOZ3mXnnJW
 NfwJoEESUBCRzlYphEeLd5AsgE1SXcNi/KRS9KZYFp4gExAFAuPHYlfIViYIHUat3atC/pvM7DV
 bnIn6a+WKcZuW
X-Received: by 2002:a05:600c:1e8d:b0:3df:deb5:6ff5 with SMTP id
 be13-20020a05600c1e8d00b003dfdeb56ff5mr1061640wmb.24.1675335296039; 
 Thu, 02 Feb 2023 02:54:56 -0800 (PST)
X-Received: by 2002:a05:600c:1e8d:b0:3df:deb5:6ff5 with SMTP id
 be13-20020a05600c1e8d00b003dfdeb56ff5mr1061603wmb.24.1675335295873; 
 Thu, 02 Feb 2023 02:54:55 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a18-20020a5d5092000000b002bdd8f12effsm19369533wrt.30.2023.02.02.02.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:54:55 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v5 04/20] scripts/clean-includes: Improve --git commit
 message
In-Reply-To: <87k010phku.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 02 Feb 2023 10:00:49 +0100")
References: <20230130132156.1868019-1-armbru@redhat.com>
 <20230130132156.1868019-5-armbru@redhat.com>
 <87sffsnmb2.fsf@secure.mitica> <875ycly2h5.fsf@pond.sub.org>
 <87bkmdfrys.fsf@secure.mitica> <87cz6twldq.fsf@pond.sub.org>
 <877cx11lny.fsf@secure.mitica> <87k010phku.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 11:54:54 +0100
Message-ID: <87zg9ws5fl.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
X-TUID: tHmOyA+6L4n+

Markus Armbruster <armbru@redhat.com> wrote:

> It's less terse.  Fine with me.  The mix of passive and active voice
> feels a bit awkward, though.  Another try:
>
>   All .c should include qemu/osdep.h first.  This script performs three
>   related cleanups:
>
>   * Ensure .c files include qemu/osdep.h first.
>   * Including it in a .h is redundant, since the .c  already includes
>     it.  Drop such inclusions.
>   * Likewise, including headers qemu/osdep.h includes is redundant.
>     Drop these, too.

Perfect, thanks.

Reviewed-by: Juan Quintela <quintela@redhat.com>

or whatever you want it O:-)

