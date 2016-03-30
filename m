Received: by 10.25.208.211 with SMTP id h202csp2677128lfg;
        Wed, 30 Mar 2016 07:53:33 -0700 (PDT)
X-Received: by 10.140.32.245 with SMTP id h108mr10226207qgh.50.1459349613208;
        Wed, 30 Mar 2016 07:53:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a197si4038919qkb.6.2016.03.30.07.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Mar 2016 07:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1alHUy-00024V-Qa
	for alex.bennee@linaro.org; Wed, 30 Mar 2016 10:53:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1alHUv-000216-QB
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 10:53:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1alHUu-0003mI-T2
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 10:53:29 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1alHUu-0003m4-Ma
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 10:53:28 -0400
Received: by mail-vk0-x235.google.com with SMTP id z68so64160415vkg.3
	for <qemu-arm@nongnu.org>; Wed, 30 Mar 2016 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cyFEUITNHKNYbn7DV9MxlVYHEn/QevH2G0YOYsAQ4C0=;
	b=TsRoE9JK4czOxB8CQrpsFkijlGCSJvMdUBbeDwPeA8CszjUciE8WxicQved60yRNqG
	FfJfcw/qRk5WpQn2w9qfg8aYgoX92UD/bz5aRtDQxOvMwN3jfBkEpnLc+EwEPolPG6YL
	okFf6JmygZv1jXUEAgo0bUc7HNZro4xlVvvDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cyFEUITNHKNYbn7DV9MxlVYHEn/QevH2G0YOYsAQ4C0=;
	b=EOXAv5l3DY6N5HwMzP5IFShDSdORGMZ34RlJT6V2ubbsPj5akU9pw782xUiAMyvuYg
	Veh6YBRsnh7Wh88ZiDU0wjcwN3uIKjmD1wkaRrbkqjAWfFbMtTKSubZWxdTgEKohuwuF
	M5ouwVj4yoLzXnR3NLEzzWFOCcfj6ecdDBTWLEH0kyOWcjZtR92AGuvuD5nGEziN2o79
	syY6YNSCyWCWFJYKe9kfu1hmbpTfmjl49rsyKLez2LIQtlb2Be4ncq5QRWsNRzgkZnmh
	XRgFshSEbuaSJQvSyocWCGrpPrhq7qR2CSipSxjuxg67IZlLE4xytKWVw2XfkhEWsufF
	iKbw==
X-Gm-Message-State: AD7BkJLW0XGSv1FjZGeMVLNp6MpMoiLdWKODR6F6CfAeEfzb/MJJoRBppRZeQKaeZO/EobsWEnBpsTWxD+KVo+1c
X-Received: by 10.176.65.102 with SMTP id j93mr5395784uad.26.1459349608196;
	Wed, 30 Mar 2016 07:53:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 30 Mar 2016 07:53:08 -0700 (PDT)
In-Reply-To: <1458788142-17509-1-git-send-email-peterx@redhat.com>
References: <1458788142-17509-1-git-send-email-peterx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Mar 2016 15:53:08 +0100
Message-ID: <CAFEAcA_YL8g4EvRNKF1rs9D30dGCxV=RBv0q-EbFQkVNGT3R0Q@mail.gmail.com>
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Andrew Jones <drjones@redhat.com>, Libvirt <libvir-list@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, Eric Blake <eblake@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v7 0/4] ARM: add query-gic-capabilities QMP
	command
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2r9HxYxQu/ij

On 24 March 2016 at 02:55, Peter Xu <peterx@redhat.com> wrote:
> v7 changes:
> - patch 1
>   - add more to commit log, about how to use the results [Markus]
>   - change interface from dict back to array [Markus, Eric]
> - patch 2
>   - kvm_arm_create_scratch_host_vcpu should raise error when init
>     non-zero, but failed to find a good CPU model [Sergey]
> - patch 3
>   - rename function to kvm_device_supported [Sergey]
> - patch 4
>   - comment line from "FIXME" to "TODO" [Sergey]
>   - make kvm-related part another function [Sergey]
>   - change result to array to follow patch 1's change

Applied this version to target-arm.next, thanks.

-- PMM
