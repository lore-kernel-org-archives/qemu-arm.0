Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp419396lfa;
        Thu, 29 Oct 2020 03:57:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKZVBxem+NBmr/mVJl6rva2yZ51Gg6BCuU8HbzeC3pm1FvGY8eGOhBF/Fz4uGypkm/8Vgb
X-Received: by 2002:a5b:745:: with SMTP id s5mr4996290ybq.255.1603969071609;
        Thu, 29 Oct 2020 03:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603969071; cv=none;
        d=google.com; s=arc-20160816;
        b=BzatmtjR4ve/AecoOnDq1wSnnmSE1E5uDs2GWLDAF5Kyg8IJlk7Ke0OQ1ONQR9kAZp
         /yXhOdMDOZ4v/uufsnGHznoGZGPyld4eEuMbz2LjjlWjqiECEIIMVBO6BzHXMEPcoLKZ
         xVdC8zSTIsJfs0pTfui/iIDonemXdwopP6OuOWUI39+TdrItcEsIYWMNocF0eqpMvjfm
         QfTRLOPgGwmCX+evtKg8qqWP/q4CTIdvg9GLbz3ex+cNaEAit/V0bH/6nmtZmgNeIi68
         2QQnDo0MinTfrrHCfqp3Gy4jIrpqPkTljhn6AjIT5qlAZtm4xfb+1lDcKJBHaERrwhWm
         u2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=qUobfChgR8/6lkiRjzQNF0SVoDxhzLwdJ3Inz6If66c=;
        b=A+mJEhcmnQIPgx3NlX/113L0L45EuS7IpCC2cY1lGLyTNBkCJbK3i5I3X2vz9r7n14
         p6CEdJNs+ssrhBU4s+q3oJe3VOxEVMkY4vTdVXnvTMMqJCYwXjYfRVBjsEMCI8LFT4PE
         JK8J52olaviJb6Ld+vti0OXs9wknUZaPQUk7WqGSE2u9VYjNgxpcYN9YRzVgmaU8MKWK
         8vsh8BZhuiCeAJF8aDe6xV7mwzW/0Bf5tpQ/+dMYwwnUkbZM+PbzSukA7LmIFvR7vfqg
         yCHKBgbH0Yf8irPeEukVphtwfR1lGMyuBt7jdIABUUm7EfAGwzH+qoLxDJ4PLTQ8UAzu
         XE8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DR7jfy5A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si3113674ybe.256.2020.10.29.03.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 03:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DR7jfy5A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kY5cs-0000jO-UP
	for alex.bennee@linaro.org; Thu, 29 Oct 2020 06:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kY5ck-0000hy-AU
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 06:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kY5ch-0003QW-Jz
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 06:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603969058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qUobfChgR8/6lkiRjzQNF0SVoDxhzLwdJ3Inz6If66c=;
 b=DR7jfy5AET3mKJm9NYcx8pbgELlrgSo+CFAT45BNHAhsKhhcbvujRndbX2enHJ7+bTNUHR
 eWhteK2e757vBJnVZIQ4ehaCgludi4Wk3EcyRXvErMA3laADEOjO4aZEhlVuGU9yU0Fyvh
 FjRFfYEuGkO6EBZ+U8xITAbCYF3U19o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-KNxDxf-SPbCnGZgbaD-lSA-1; Thu, 29 Oct 2020 06:57:34 -0400
X-MC-Unique: KNxDxf-SPbCnGZgbaD-lSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 700551900081;
 Thu, 29 Oct 2020 10:57:33 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB0FC1974D;
 Thu, 29 Oct 2020 10:57:32 +0000 (UTC)
Date: Thu, 29 Oct 2020 06:57:31 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: Dynamic instance properties in TYPE_ARM_CPU
Message-ID: <20201029105731.GI5733@habkost.net>
References: <20201026172219.GA5733@habkost.net>
 <20201029101627.umh4gqxiujwde4xp@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201029101627.umh4gqxiujwde4xp@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EQ2kYaRamWfZ

On Thu, Oct 29, 2020 at 11:16:27AM +0100, Andrew Jones wrote:
> On Mon, Oct 26, 2020 at 01:22:19PM -0400, Eduardo Habkost wrote:
> > I've been trying to clean up the qdev property code (to bridge
> > the gaps between qdev and QOM, and between QOM and QAPI), and
> > I've noticed that TYPE_ARM_CPU is the only remaining user of
> > qdev_property_add_static().
> > 
> > qdev_property_add_static() has a misleading name: it won't
> > register a static property.  It is actually a hack to use a
> > static Property variable (defined using DEFINE_PROP*), but
> > register it as a dynamic instance property.
> > 
> > Dynamic instance properties make introspection hard.  What can we
> > do to get rid of them in TYPE_ARM_CPU?
> > 
> > Can we just register all the properties unconditionally, and
> > error out on realize if the requested CPU configuration is
> > incompatible with the available CPU features?
> > 
> > The following properties are registered as dynamic instance
> > properties at arm_cpu_post_init():
> > "cntfrq", "reset-cbar", "reset-hivecs", "rvbar", "has_el2",
> > "has_el3", "cfgend", "vfp", "neon", "dsp", "has-mpu",
> > "pmsav7-dregion", "secure-memory", "pmu", "idau", "init-svtor",
> > "tag-memory", "secure-tag-memory".
> 
> Hi Eduardo,
> 
> Are properties added at runtime with
> 
>   if (this_config_wants_this_property)
>     object_property_add(...)
> 
> also considered dynamic instance properties? If so, then
> arm as many more than the ones listed above. And, if not,
> then it should be pretty easy to convert the ones listed
> above to this if-want-add pattern.

Yeah, all object_property_add() calls are also dynamic instance
properties.

Being conditional makes them more difficult to convert to
introspectable class properties (unless the condition is a
function of class information only).

-- 
Eduardo

