Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2183218njb;
        Mon, 29 Jul 2024 23:16:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZTMhlmENJgUeNMeInJU5QknhemuhyBLTvbhmS0KIQ73HHOK5sa+qpswzMp1fhG2VTEwgyrA8qx/IiYiqfQpJ0CEFuncEb
X-Google-Smtp-Source: AGHT+IFMKsW+tU+hym0uB5SEHS/jR++innWimGnc7fE2OIVtATW0WYJFF2aWIZ5jnBTZvC45wBLO
X-Received: by 2002:a17:907:868b:b0:a7a:a06b:eec9 with SMTP id a640c23a62f3a-a7d3ffa3dcemr700374666b.4.1722320206516;
        Mon, 29 Jul 2024 23:16:46 -0700 (PDT)
Return-Path: <linux-kernel+bounces-266826-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-a7acacac167si728811366b.897.2024.07.29.23.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 23:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-266826-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@kernel.org header.s=k20201202 header.b=Ex+pIZyZ;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of linux-kernel+bounces-266826-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-266826-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E42A41F23C9C
	for <alex.bennee@linaro.org>; Tue, 30 Jul 2024 06:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D04716A921;
	Tue, 30 Jul 2024 06:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ex+pIZyZ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E675168486
	for <linux-kernel@vger.kernel.org>; Tue, 30 Jul 2024 06:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722320193; cv=none; b=ZMkgykbscgj+EUvf19oPeT5vSyxF9oxtksAezcoBma+sak2Xv2/h4vj/BxWakjN0L0EbwPRoeNvlCacm4cBbUtCsl9RxLxo/Ng3j6efIF7rcJG3+zkK5Js94Gx8Qvkbak8DWEvF1OA1oAL6A1vVD9wONLC4w232Fg6clwDv4rDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722320193; c=relaxed/simple;
	bh=BRy3EumtsayESW490iJoX78v2fJzwIdLETnfNWc7UdE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TdC5X2lztEaViH/o4t8aW5/lJVLC7+6U9J4gYNiStB70cWDqcoolyqQX5mJf9WqEDrmAyKQxTr495ce/RyOYjuUtexlgMnyI+YPletcDImNEX7tCEw3AghbzVk3Eb2nAG/vw+zk1A71YzAiXg8e8aeoAgD1x/uO439UFmgkTphI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ex+pIZyZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE05BC32782;
	Tue, 30 Jul 2024 06:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722320192;
	bh=BRy3EumtsayESW490iJoX78v2fJzwIdLETnfNWc7UdE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ex+pIZyZGhCHy4nhR5GKhkx5L7jGhDcHpXlc4Al8Wf9/94EQLPHAf0qsyYY7PDgbV
	 sZsT3V0He1cO+zcu+cxCQVaYIOlR55SGxfUaU5E6280/ER3rDRNyoSGqfLEnRkTimO
	 +SHbfaZBKkl4NN5Org53nndC1KYXL0frMFUEA2LQbmbfXEmxdF/LuY3u1nBDju9geF
	 tZnFFFp+daHZBEGLkGMBqo2XTGx78hOdn9Ke8gtinwkwoXzSghxmW7B0GAhewQ/zXb
	 I8WdFqfzqq+ojiB4DSmB/AjSfElY8Kywu7JRW/mrW/1635OUtFITflTF8A/jJeHKFG
	 BCtSSudCSjsYg==
Date: Tue, 30 Jul 2024 08:16:23 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Markus Armbruster
 <armbru@redhat.com>
Cc: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Eric Blake <eblake@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Michael Roth <michael.roth@amd.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 6/6] acpi/ghes: Add a logic to inject ARM processor
 CPER
Message-ID: <20240730081610.6390c423@foz.lan>
In-Reply-To: <20240729173109.00006911@Huawei.com>
References: <cover.1722259246.git.mchehab+huawei@kernel.org>
	<7e0c1ae181e9792e876ec0e7d2a9e7f32d7b60ac.1722259246.git.mchehab+huawei@kernel.org>
	<20240729173109.00006911@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 44RxhSKl995n

Em Mon, 29 Jul 2024 17:31:09 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Mon, 29 Jul 2024 15:21:10 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

...

> Markus suggested:
> 
> > A target-specific command like this one should be conditional.  Try
> > this:
> > 
> >     { 'command': 'arm-inject-error',
> >       'data': { 'errortypes': ['ArmProcessorErrorType'] },
> >       'features': [ 'unstable' ],
> >       'if': 'TARGET_ARM' }
> >
> > No need to provide a qmp_arm_inject_error() stub then.  
> 
> (I noticed because never knew you could do this.)
> 
> Probably crossed with your v4 posting.

Tried it, but can't figure out how to properly set it up at meson.build,
as it is basically producing build time errors during qapi file generation
on non-ARM platforms. For instance:

FAILED: libqemuutil.a.p/meson-generated_.._qapi_qapi-visit-arm-error-inject.c.o 
cc -m64 -Ilibqemuutil.a.p -I. -I.. -Isubprojects/libvhost-user -I../subprojects/libvhost-user -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/sysprof-6 -I/usr/include/gio-unix-2.0 -I/usr/include/p11-kit-1 -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -fstack-protector-strong -Wempty-body -Wendif-labels -Wexpansion-to-defined -Wformat-security -Wformat-y2k -Wignored-qualifiers -Wimplicit-fallthrough=2 -Winit-self -Wmissing-format-attribute -Wmissing-prototypes -Wnested-externs -Wold-style-declaration -Wold-style-definition -Wredundant-decls -Wshadow=local -Wstrict-prototypes -Wtype-limits -Wundef -Wvla -Wwrite-strings -Wno-missing-include-dirs -Wno-psabi -Wno-shift-negative-value -isystem /new_devel/edac/qemu/linux-headers -isystem linux-headers -iquote . -iquote /new_devel/edac/qemu -iquote /new_devel/edac/qemu/include -iquote /new_devel/edac/qemu/host/include/x8
 6_64 -iquote /new_devel/edac/qemu/host/include/generic -iquote /new_devel/edac/qemu/tcg/i386 -pthread -msse2 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -ftrivial-auto-var-init=zero -fzero-call-used-regs=used-gpr -fPIE -DWITH_GZFILEOP -MD -MQ libqemuutil.a.p/meson-generated_.._qapi_qapi-visit-arm-error-inject.c.o -MF libqemuutil.a.p/meson-generated_.._qapi_qapi-visit-arm-error-inject.c.o.d -o libqemuutil.a.p/meson-generated_.._qapi_qapi-visit-arm-error-inject.c.o -c qapi/qapi-visit-arm-error-inject.c
In file included from qapi/qapi-visit-arm-error-inject.h:17,
                 from qapi/qapi-visit-arm-error-inject.c:15:
qapi/qapi-types-arm-error-inject.h:18:13: error: attempt to use poisoned "TARGET_ARM"
   18 | #if defined(TARGET_ARM)
      |             ^
In file included from /new_devel/edac/qemu/include/exec/poison.h:7,
                 from /new_devel/edac/qemu/include/qemu/osdep.h:38,
                 from qapi/qapi-visit-arm-error-inject.c:13:
./config-poison.h:718:20: note: poisoned here

Such error is created by two files generated from qapi, due
to this change:

	diff --git a/qapi/meson.build b/qapi/meson.build
	index e7bc54e5d047..5927932c4be3 100644
	--- a/qapi/meson.build
	+++ b/qapi/meson.build
	@@ -24,2 +24,3 @@ endif
	 qapi_all_modules = [
	+  'arm-error-inject',
	   'authz',

No idea how to fix it.

Thanks,
Mauro
