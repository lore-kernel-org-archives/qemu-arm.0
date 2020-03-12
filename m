Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp412123lfc;
        Thu, 12 Mar 2020 02:52:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsfX0IqsDKdCOpYzr5/XtPhy6K8ai2BzizDBIo9MxihxmBbphG4RPfTJ83RZtF1UsrSdcKD
X-Received: by 2002:a37:9f42:: with SMTP id i63mr6824881qke.192.1584006752341;
        Thu, 12 Mar 2020 02:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584006752; cv=none;
        d=google.com; s=arc-20160816;
        b=Bhyypg+Sn2hpndZy/L2FDUI6dZfCp6rwLx9BCP1zb97QQg5oylsGDktOxM4ydNldvN
         RPhat0Adw1VOimiiBRMWBf4dhL+r6nmlwNCj2CTOc3fa6qcBpxaY7mnv74sH9F56PhM8
         SnKAu45JGktIR/gxtcNtDPFcuv0M9sUWPcBffJeeafNlSz8PzFopWrHzbcn+ufB0nK2+
         FUa7Q/6iH6mUo2trtjPQru6Ny/rloFT9hfV5ANFgtZeQtkHrwy6Q2sp58bzxe0H0/Cqp
         PoNMgtq/o7kp7khCaEyrT/ntawDgoiXuakCeQN8gi8GHfoBCAmmgKlX4psJEYt6+TbVa
         sj/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=G8CWq5+YpgS8qKmE4m/6+V8hfmkS//mGZarIWdmX8zM=;
        b=B8hyWMm4GB6hDScd3w7j+J89mqxiBI7wsKgoPWd2agAvwD8VlFYiNFIlxWr/Ipn7rd
         8+fyDMIMhiKwTatYU+vfcEUqrm74IhH/ess3iS6et4WUjCySmDx7hDZL2t7c9+GilE++
         nm0D9fvpvBgI05Qccbr7RFO2NSC7tc4hbrbfQmR/7UBuAfSNIrxnEVExLYJd/a1ov7qC
         XDaOYS3v0fGyfp/PViSnr4oGizxtz8T/JcvNeZnoId8A+kiY8NH1Nx9MWU0RCXTQcS8T
         Oxfx2jlThzkZnzwpEk0Jb2L/Vbq2xxDl6c+e0YEnCh3P714T1rbD6LFRs85rmo0EG6Hc
         1M9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b="b/vhPXqY";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id g12si2116564qvt.161.2020.03.12.02.52.32;
        Thu, 12 Mar 2020 02:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b="b/vhPXqY";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C051B4A4F7;
	Thu, 12 Mar 2020 05:52:31 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g72fHRPVlaA4; Thu, 12 Mar 2020 05:52:30 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id AEB4F4A50F;
	Thu, 12 Mar 2020 05:52:30 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 649704A49C
 for <kvmarm@lists.cs.columbia.edu>; Thu, 12 Mar 2020 05:52:29 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2gHHtiWOIqu for <kvmarm@lists.cs.columbia.edu>;
 Thu, 12 Mar 2020 05:52:28 -0400 (EDT)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 1615D4A32E
 for <kvmarm@lists.cs.columbia.edu>; Thu, 12 Mar 2020 05:52:28 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584006747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zG8vPwXr3fW379kNEBs9k2zxUAhuYclstIC5n/OmTcY=;
 b=b/vhPXqYYMPntaKThNrjs0cdotHtowm7mHi1sfI8pzgA2TkmRQ7LisHKFwWNsgvjb53S61
 hVTuRmZIfLTku29lMyMqfHMUaNbrFa4TZd+WVTFYf4W4S8G5UIdXy/5igSOaVlJ6r8TJe0
 f6vsYGjSxQ2bTlqcc7kDYyLEU34inDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-0hKgPFkoNW-VDLxp0GcLmg-1; Thu, 12 Mar 2020 05:52:26 -0400
X-MC-Unique: 0hKgPFkoNW-VDLxp0GcLmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F1B7800D4E;
 Thu, 12 Mar 2020 09:52:24 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBE8360BEC;
 Thu, 12 Mar 2020 09:52:22 +0000 (UTC)
Date: Thu, 12 Mar 2020 10:52:20 +0100
From: Andrew Jones <drjones@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v3 1/2] target/arm: kvm: Inject events at the last stage
 of sync
Message-ID: <20200312095220.bb6xdezdujufnfzg@kamzik.brq.redhat.com>
References: <20200312003401.29017-1-beata.michalska@linaro.org>
 <20200312003401.29017-2-beata.michalska@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200312003401.29017-2-beata.michalska@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: QCthwDcuMheQ

On Thu, Mar 12, 2020 at 12:34:00AM +0000, Beata Michalska wrote:
> KVM_SET_VCPU_EVENTS might actually lead to vcpu registers being modified.
> As such this should be the last step of sync to avoid potential overwriting
> of whatever changes KVM might have done.
> 
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  target/arm/kvm32.c | 15 ++++++++++-----
>  target/arm/kvm64.c | 15 ++++++++++-----
>  2 files changed, 20 insertions(+), 10 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
