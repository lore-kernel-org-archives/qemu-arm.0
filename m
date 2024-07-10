Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp442870njb;
        Wed, 10 Jul 2024 08:44:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOT4gZp3NfETGAUs0Q2Rbd6lMXJY30Tn+hNcQWQmm3AwiLFlVed6RjRi9GvCu/l17lb09HGqjzkzf3r4R8HvPMnBxxv6oy
X-Google-Smtp-Source: AGHT+IE7A3AbRYgjz/qyZmpkCcMXIj8PVsk7jFb78Hx4abaAXj7XK7zYyb1sS4Jt0+dITiC1V9Sd
X-Received: by 2002:ac8:588f:0:b0:446:37c2:f00a with SMTP id d75a77b69052e-447faab351dmr84272491cf.45.1720626293315;
        Wed, 10 Jul 2024 08:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720626293; cv=none;
        d=google.com; s=arc-20160816;
        b=YRsqcSextnKzoQtXZUmsg9k3HWfwlpxBYzOui7NngLAWYskpDYXvhbfitrw5mz3ELG
         IBOPjmn48pPvfJ7/jspxLNCu3QdxewT4HE6UxC/kqZR2svMCx1lX/aLBy7rMX/a/XXfh
         WcVyYTO7bBK/wC2lhnRklikjHETusH0vyEWK+R+WCaR5QzF3CrDXkk3E/GCHcQgEOHzL
         Td20myrVbhtOipr77XJg+ddRTumnVlTaXL+Ava8EB22WWEgKLEHFuNxd9el9OR8Tk/LH
         iNgoufUShbJ3Xy1EQcvkxmhxJJpvmDSJjTBSEdIisOSjIN6HDWhv0kj3TCp81iKuQEcN
         29iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=NH0YphbLJIChi/3SkiNAIIFjNtwVxbllg4kSIpTdYuo=;
        fh=QPevuNSUOBeG4G552Z8gZh1613W9HgxuNEV/1MotDjk=;
        b=yG0MQvpKDXjDkGq17NNKx3kjZ+A4HEGNuUVJmqg39dyQOBVM1WnjZaW8UguwVIDHLM
         4y2V3fyLOJXsqbDfwogWneAwsjoY4fG2D1QKhm/tb80IoJpWmVxrJYTt9Pav2CXedyq4
         INcUEaFlqPsrEWJGqpe9Outdr3d9G4ghIWP7iOMKyMGG+PHnIAnmyDYO8mlx68EBpR5I
         LYrPMG3ECK48wOZ6UzUu/ycvVqzse/DQ1W4js/lkpFHc/v5gDWilqGrtLAsO+k3zb0sd
         0bZtGE7yongM5Le22lAVnosxk8cfzaZVcwpyDuMTRMt08jjYNPILF+tl/FrnPWrEqG13
         E4Qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BN3TyjRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bf95casi47897111cf.644.2024.07.10.08.44.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 08:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BN3TyjRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRZUM-0002At-M6; Wed, 10 Jul 2024 11:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1sRZUL-00025R-8S
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 11:44:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1sRZUJ-0003aL-Nc
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 11:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720626250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NH0YphbLJIChi/3SkiNAIIFjNtwVxbllg4kSIpTdYuo=;
 b=BN3TyjRs+UMvW9oo/WfIJBxENYvaamV/w0XVrvzLakvqwaWmbYJ0WOBCXxohNrFkRnovEX
 zWk5IYag5z76/Y82sfIAUwMUfMx0EmQyuPVV9g01oUdfqA0swQvTHPURwCsTqC4oaX0AsU
 q1CKpIWwQnMEkPy8PF03QnN2dR8QdGI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-356-X00OlGg2Ouajqc9bsQ_Q5Q-1; Wed,
 10 Jul 2024 11:42:54 -0400
X-MC-Unique: X00OlGg2Ouajqc9bsQ_Q5Q-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DAFF019560AB; Wed, 10 Jul 2024 15:42:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.152])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 354363000182; Wed, 10 Jul 2024 15:42:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 darren@os.amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: Re: [PATCH] arm/kvm: add support for MTE
In-Reply-To: <20240709060448.251881-1-gankulkarni@os.amperecomputing.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy Ross"
References: <20240709060448.251881-1-gankulkarni@os.amperecomputing.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 10 Jul 2024 17:42:45 +0200
Message-ID: <875xtdcky2.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kaWLXwCV/pkC

On Mon, Jul 08 2024, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:

> Extend the 'mte' property for the virt machine to cover KVM as
> well. For KVM, we don't allocate tag memory, but instead enable
> the capability.
>
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> This patch is rework of commit b320e21c48ce64853904bea6631c0158cc2ef227
> which broke TCG since it made the TCG -cpu max
> report the presence of MTE to the guest even if the board hadn't
> enabled MTE by wiring up the tag RAM. This meant that if the guest
> then tried to use MTE QEMU would segfault accessing the
> non-existent tag RAM.

So, the main difference to my original patch is that we don't end up
with MTE in the max model if we didn't configure tag memory, but the
rest of the behaviour stays the same?

>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>

(...)

> +void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
> +{
> +    static bool tried_to_enable;
> +    static bool succeeded_to_enable;
> +    Error *mte_migration_blocker = NULL;
> +    int ret;
> +
> +    if (!tried_to_enable) {
> +        /*
> +         * MTE on KVM is enabled on a per-VM basis (and retrying doesn't make
> +         * sense), and we only want a single migration blocker as well.
> +         */
> +        tried_to_enable = true;
> +
> +        ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0);
> +        if (ret) {
> +            error_setg_errno(errp, -ret, "Failed to enable KVM_CAP_ARM_MTE");
> +            return;
> +        }
> +
> +        /* TODO: Migration is not supported with MTE enabled */

Do you have a plan for enabling migration in the future? From what I
remember, pre-copy support should be doable within QEMU (with a similar
approach to e.g. s390 skey), but post-copy would need a kernel API
extension to support getting additional data while faulting in a page.

> +        error_setg(&mte_migration_blocker,
> +                   "Live migration disabled due to MTE enabled");
> +        if (migrate_add_blocker(&mte_migration_blocker, errp)) {
> +            error_free(mte_migration_blocker);
> +            return;
> +        }
> +        succeeded_to_enable = true;
> +    }
> +    if (succeeded_to_enable) {
> +        object_property_set_bool(cpuobj, "has_mte", true, NULL);
> +    }
> +}

