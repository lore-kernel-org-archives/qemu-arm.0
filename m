Received: by 10.25.205.13 with SMTP id d13csp551223lfg;
        Tue, 10 Jan 2017 19:39:11 -0800 (PST)
X-Received: by 10.200.50.209 with SMTP id a17mr6584526qtb.288.1484105951605;
        Tue, 10 Jan 2017 19:39:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b24si2838304qtb.143.2017.01.10.19.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jan 2017 19:39:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cR9kl-0008G4-2t
	for alex.bennee@linaro.org; Tue, 10 Jan 2017 22:39:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cR8bE-0004In-CT
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 21:25:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cR8bD-0008Br-KN
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 21:25:16 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:34890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1cR8bB-00088q-Cb; Tue, 10 Jan 2017 21:25:13 -0500
Received: by mail-pf0-x244.google.com with SMTP id f144so12550360pfa.2;
	Tue, 10 Jan 2017 18:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=vZpJFxElSN6Rts1qJiv5Qamf9N4eZRFtRGPlSn6lfBI=;
	b=jnAcIQfY3vIWw4hBANgq10Xm4wFi6GBKTA0upy658UUleNkbCGtmuCGdhvqk07jcpn
	NSjjQxJRN12vPMBUoFQwG/peJS1/50wSa/A/Facxblw6mVEeVQFgAinGCELIXZsVIy49
	BBeNgfrxm3Bruu/dNiHlScY+2LmiIoEvuP/vcI4CEyV1bxu4NMHYjYBoAmbVD97Q33Ip
	er6uy5H4I7HZ9s6KqBw/CEempSo4t3OzRRIB65LVEdMPLI/jaBMfDiXMNOyunueQC7/w
	pDC4Q0vyy456Q1VzJaMxPGXfvWmkgd7Plvtc06VEWDPRvFcHfYvU1SPsqWxYPNvKg12Y
	Wifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=vZpJFxElSN6Rts1qJiv5Qamf9N4eZRFtRGPlSn6lfBI=;
	b=BGNHwjUAPUKGrn7SFAUkjzBMAlMUQ7Ub1H3eym16yhTt+8Z0/ffmjpRyErjfjSBILC
	bmZg9044OuPVt13Iofa/Jd8mHaXdJBbNgDHgIpzrl9IgJQWZjLNZJJfxhNwvCaNJzpKk
	Uo+Jwj3bS1B37py8fzSe5kHt/n7ERGwJU1ctJrkNxaUcExELfCnI0RcGPOShyM3SziMO
	KJ50dKiyNriVbKgsxXdwwVmrcgtbykdg+je3O259wyj+d9SrScZ1RIq9MmJslApiW7kY
	liFJRI8O/xcIEHzZfmTbUdV+I1qg9J544JA9kSr4NcI++dT0NmQvCrfefkXHG248MSCq
	R5Xg==
X-Gm-Message-State: AIkVDXIM6lUn1Dp021cUFb2t4aTNlb3emjKu+YhN7EAAuGD0a/9O7k6IVOK/xxKrbYce6g==
X-Received: by 10.98.70.194 with SMTP id o63mr7509986pfi.49.1484101512323;
	Tue, 10 Jan 2017 18:25:12 -0800 (PST)
Received: from bigtime.twiddle.net ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
	by smtp.googlemail.com with ESMTPSA id
	f65sm8733504pfk.5.2017.01.10.18.25.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 18:25:11 -0800 (PST)
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
	qemu-devel@nongnu.org
References: <148294246378.10801.8881527920302104439.stgit@fimbulvetr.bsc.es>
	<148294246924.10801.16850780392122412532.stgit@fimbulvetr.bsc.es>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <9fc6043f-fdb5-0212-a76d-c3383dcd76ff@twiddle.net>
Date: Tue, 10 Jan 2017 18:25:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <148294246924.10801.16850780392122412532.stgit@fimbulvetr.bsc.es>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/6] Pass generic CPUState to
 gen_intermediate_code()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <laurent@vivier.eu>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@imgtec.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Jia Liu <proljc@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9fyxrhP5SEji

On 12/28/2016 08:27 AM, Lluís Vilanova wrote:
> Needed to implement a target-agnostic gen_intermediate_code() in the
> future.
>
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
