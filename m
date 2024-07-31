Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp202255njb;
        Wed, 31 Jul 2024 00:23:23 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV+hHUNCPI9yJRUUnYBf7DxR+SfbdhjRankrV5+axR4O4LW91UQlxzl4HPGaNgapxoxaqhhaCShEKK8CyJkeH1tctNObMLg
X-Google-Smtp-Source: AGHT+IEwVS4W8glsrkT+7O7W8qvVS5TU8vDtHcgb1GFNpEJai+2Iqw0Kg/RqtfNP5eczd7eW2d34
X-Received: by 2002:a05:6214:212e:b0:6b5:3eb:6cf6 with SMTP id 6a1803df08f44-6bb55ab1a0bmr212888136d6.40.1722410603352;
        Wed, 31 Jul 2024 00:23:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722410603; cv=pass;
        d=google.com; s=arc-20160816;
        b=yPb7GNmIgN5odFC5L/Th0RPpPrMxkUy+D36rYuQZpqoyh6eODJld/DBban7S1FsWqe
         ufOPnNNALW4tjN9v0oA+LeZ5H0myve1yquxmG6OunbzX3JBtw3G3GKLOB1k4M8GWiWF3
         zQbaoBsdKXAdrrLFZWuHLEU0sQlCPNTXs/ID73k1Lo/qZ+zl/2xv+j/6EhtovK3RCNpn
         Xl6naqGra/+fytLTQuuCj1QtC3XheP89N0SzlLe1+pMOiNbZdlViRsE5hdjbmA2syPM6
         2+sIxPQJsw31Oi2sxOIfpsq2Ww4CLUPuwAc/W3yCCqZDDWFeBWj0mVC8RKDY1POiZjLR
         QqbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=nug2VN2gGRBXd0B3UkSsblwDOysWdZxSO5FtNrujILk=;
        fh=R/ykSIMu94JBVKvd5yt6BsarHkSAcMvCbU9SJa3OZYg=;
        b=ju3BNQmmk6pxmpDXLHLFOjvchPck0/8RTp1wX933FReZV/6tDeGNJi4ZlMWCWi4A/Y
         AgjnND5eK9PSyqdokWDNeBOok2sl3o3WA/8LoCOtgUpU+iREX4FUsB+pCtxbPFCEB6CS
         pp6Fyo6zMsmyCaS6Ttfi6QNzK2Ap0y8wJLMxfX6gxaAPU/9AKJStLg9Qeo5ZqpEXeT2t
         ryNZLQ+y9PrqxZQpHsvrAwlfpBw3zW2yYJaW/+9MIkj1/VRNwTQFUBy8UK13jirCEjzp
         4ttwyKWFZWhGVoymdeS/n/lbBnMvhV4S5UzOxv/ujuaVzeqCz0bgtBYsf9H4u1TebIhT
         eLGw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aE7ZTf6M;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-268678-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-268678-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-268678-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3f8f04e4si144832616d6.172.2024.07.31.00.23.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-268678-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aE7ZTf6M;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-268678-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-268678-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E9161C21349
	for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 07:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0157C1A4F1C;
	Wed, 31 Jul 2024 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aE7ZTf6M"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8B834CDE
	for <linux-kernel@vger.kernel.org>; Wed, 31 Jul 2024 07:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722410599; cv=none; b=cskxCuSIcRJbhrNHEJbRbZBLnY1djlPEs2nbJ5fYcHUTmT2TUenSM07/KKQZTvsb58lvdAv6dw+2LbR90WZf5X2XnTQvA5xaBytQNgq48gyz/ANbQZDhZDGa0mVZGBf7KG4x53KIBPFw6kC5waY3DzjTQaZMvB+2mPmUIrWkgVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722410599; c=relaxed/simple;
	bh=pht1LCagrQePY+cesWWIX1rFb8rJui0PYWMerxpoIu8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nP241HyKmDTBpyJKX9/SUNbMglcoCoEIrK1lcUcKazxU4mZbO/dv8GtJ+px4eCx6I4NQS5an5iwSrP0+fZ8KVDL+OoGhOXHYxSWA3ve+YhXNuT5wjgSYW6svecAKGQCLNKYT8SIKAMIZMXlwIe0SP95emU11vEkWcqi/SVFySRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aE7ZTf6M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722410597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nug2VN2gGRBXd0B3UkSsblwDOysWdZxSO5FtNrujILk=;
	b=aE7ZTf6MHj0rEjlarUlk9N8gvXeOPeqUPs7FLruZvf2WicpP4/rYqTvX2bv1bcN966LFRd
	9C2I5CtPfvR+Pr5+uqvxMT06mGYik89l9ttrS32BQPzhl6TJORfFpo/rlUqL07NRbErQPB
	lNrQrLQypaOivZxB35gV+GHhCDpjEaI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-548-zhhrRXkFOp25zI8T3M6mSw-1; Wed,
 31 Jul 2024 03:23:13 -0400
X-MC-Unique: zhhrRXkFOp25zI8T3M6mSw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 42C671955BEF;
	Wed, 31 Jul 2024 07:23:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.65])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F1501955E80;
	Wed, 31 Jul 2024 07:23:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6366221E668B; Wed, 31 Jul 2024 09:23:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>,  Shiju Jose
 <shiju.jose@huawei.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Ani
 Sinha <anisinha@redhat.com>,  Dongjiu Geng <gengdongjiu1@gmail.com>,  Eric
 Blake <eblake@redhat.com>,  Igor Mammedov <imammedo@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  <linux-kernel@vger.kernel.org>,
  <qemu-arm@nongnu.org>,  <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 6/6] acpi/ghes: Add a logic to inject ARM processor CPER
In-Reply-To: <20240730081610.6390c423@foz.lan> (Mauro Carvalho Chehab's
	message of "Tue, 30 Jul 2024 08:16:23 +0200")
References: <cover.1722259246.git.mchehab+huawei@kernel.org>
	<7e0c1ae181e9792e876ec0e7d2a9e7f32d7b60ac.1722259246.git.mchehab+huawei@kernel.org>
	<20240729173109.00006911@Huawei.com> <20240730081610.6390c423@foz.lan>
Date: Wed, 31 Jul 2024 09:23:07 +0200
Message-ID: <87le1ija90.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: MI/rdO4Ue+AR

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Mon, 29 Jul 2024 17:31:09 +0100
> Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:
>
>> On Mon, 29 Jul 2024 15:21:10 +0200
>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>
> ...
>
>> Markus suggested:
>> 
>> > A target-specific command like this one should be conditional.  Try
>> > this:
>> > 
>> >     { 'command': 'arm-inject-error',
>> >       'data': { 'errortypes': ['ArmProcessorErrorType'] },
>> >       'features': [ 'unstable' ],
>> >       'if': 'TARGET_ARM' }
>> >
>> > No need to provide a qmp_arm_inject_error() stub then.  
>> 
>> (I noticed because never knew you could do this.)
>> 
>> Probably crossed with your v4 posting.
>
> Tried it, but can't figure out how to properly set it up at meson.build,
> as it is basically producing build time errors during qapi file generation
> on non-ARM platforms. For instance:
>
> FAILED: libqemuutil.a.p/meson-generated_.._qapi_qapi-visit-arm-error-inject.c.o 

[...]

> In file included from qapi/qapi-visit-arm-error-inject.h:17,
>                  from qapi/qapi-visit-arm-error-inject.c:15:
> qapi/qapi-types-arm-error-inject.h:18:13: error: attempt to use poisoned "TARGET_ARM"
>    18 | #if defined(TARGET_ARM)
>       |             ^
> In file included from /new_devel/edac/qemu/include/exec/poison.h:7,
>                  from /new_devel/edac/qemu/include/qemu/osdep.h:38,
>                  from qapi/qapi-visit-arm-error-inject.c:13:
> ./config-poison.h:718:20: note: poisoned here
>
> Such error is created by two files generated from qapi, due
> to this change:
>
> 	diff --git a/qapi/meson.build b/qapi/meson.build
> 	index e7bc54e5d047..5927932c4be3 100644
> 	--- a/qapi/meson.build
> 	+++ b/qapi/meson.build
> 	@@ -24,2 +24,3 @@ endif
> 	 qapi_all_modules = [
> 	+  'arm-error-inject',
> 	   'authz',
>
> No idea how to fix it.

Uh, I neglected to point out an important detail.  Sorry about that!

The 'if' condition uses a symbol that is poisoned in target-independent
compiles.  Such conditions work only in target modules.  By convention,
these are named FOO-target.json.

So, you can either change new module's filename to end in -target.json,
or you stick the command into one of the two existing target modules,
machine-target.json and misc-target.json.

Speaking of modules: i'm not sure dedicating a module just to ARM error
injection is a good idea.  Perhaps we could have arm-target.json for
things that will only ever make sense on ARM.  Same for other targets.

But I recommend to first reach consensus on Igor's objection in review
of v3:

    Message-ID: <20240730131709.10e72c7d@imammedo.users.ipa.redhat.com>
    https://lore.kernel.org/qemu-devel/20240730131709.10e72c7d@imammedo.users.ipa.redhat.com/

