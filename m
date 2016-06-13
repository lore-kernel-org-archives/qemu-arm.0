Received: by 10.25.85.209 with SMTP id j200csp1312656lfb;
        Mon, 13 Jun 2016 10:04:18 -0700 (PDT)
X-Received: by 10.140.159.12 with SMTP id f12mr15659794qhf.61.1465837458098;
        Mon, 13 Jun 2016 10:04:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 142si15711739qke.285.2016.06.13.10.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 10:04:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCVHd-0008Sy-Eo
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 13:04:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bCVHW-0008Qp-8F
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 13:04:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bCVHR-0001Ap-80
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 13:04:10 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:36279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bCVHQ-00019E-G6; Mon, 13 Jun 2016 13:04:05 -0400
Received: by mail-wm0-x234.google.com with SMTP id n184so87497196wmn.1;
	Mon, 13 Jun 2016 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=0r4LKhZr1bc6RTYJ/kq2jUt+68NaxmCdauYNYTydh60=;
	b=zJEjuyOW9htNB9NGKVQbgMo5rixenMcRKk65AtgpOX0uOTPS/RkV0T9YGXDa/Iv28s
	ZWP1voPXOQ/N8E4h4UHF6U1Q9uTdNMeNrW3l8mkv5DYShLFDiu7JSYG+c7/spY0XFHjC
	MuKnLrx+J6RcdWKzU6C90WuzCZraxwmGS6VqwVJ/hY5/RZgIkQk55Z+XQd8gpdHLJnLa
	NbLOt8lcGO3KRCj5hv0LrEVsBcJP7AI5S+vRec9bZWiIoBNBrh9PYS1zQhjPhSnoG13r
	yxPxyUXyLiB+oLVcc+SaoI5FDkWly8s8RBxWG9H7eJjMLpwdMaFmIVR4IRzZY4B7PJBS
	aC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=0r4LKhZr1bc6RTYJ/kq2jUt+68NaxmCdauYNYTydh60=;
	b=fSB7XOXvkxXQxAbyKgV962WEU/2prVfrKvAUaOVQMXGFECst5uKPHHUub1AayDuBmz
	D7uhH63uAljnuJ84g2/2y/kxPZ/HCuC2EPgBVmTG+yw05bJbLH1r64r2nRBHK+mYW/9g
	JhtLn/Ww9hnJAsUEi+RaCzsBRhma0KOCMb+vmcBpb7LKbCTdgfbQJV98EaiKWndGBgRz
	CkWLq+7RI4Xh5QeJdT0HRygQ+w0Q9Wdhi6VaC+MApxE/C6vLNxBYqsdYMj/EaV5PYy7T
	bw+SX2WNr6oOf+TGk3PWW2UjSmHs3R6aUbF6Cs87oCk138Jq98GrLk4qv63qZFabiU1o
	ZEcw==
X-Gm-Message-State: ALyK8tJusAUXNWB7Jmpvpl53B0bkWOHCBJkV2HyPMsDLsyBhdm7WWVPdo2mZRJi+zvgFQw==
X-Received: by 10.28.9.14 with SMTP id 14mr595901wmj.50.1465837443566;
	Mon, 13 Jun 2016 10:04:03 -0700 (PDT)
Received: from [192.168.10.150] (94-39-188-118.adsl-ull.clienti.tiscali.it.
	[94.39.188.118]) by smtp.googlemail.com with ESMTPSA id
	i74sm713013wmg.21.2016.06.13.10.04.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2016 10:04:02 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-7-git-send-email-drjones@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d4b656c3-757d-7922-bd1b-38b4101a4519@redhat.com>
Date: Mon, 13 Jun 2016 19:04:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465580427-13596-7-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-arm] [PATCH RFC 06/16] vl: move smp parsing to machine
 pre_init
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	dgibson@redhat.com, imammedo@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NZGOG2XpiFKL



On 10/06/2016 19:40, Andrew Jones wrote:
> +    if (sockets == -1 || cores == -1 || threads == -1 ||
> +        maxcpus == -1 || cpus == -1) {
> +        error_report("cpu topology: "
> +                     "all machine properties must be specified");
> +        exit(1);
> +    }
> +

I think it's sane to accept some defaults.  It must not be the DWIM
thing that -smp does (which is targeted to Windows's dislike of
multi-socket machine on consumer hardware).  It must be something that
makes sense, and my proposal is:

- threads: 1
- cores: 1
- sockets:
  - maxcpus / (cores * threads) if maxcpus given
  - cpus / (cores * threads) if cpus given
  - else 1
- maxcpus: cores * threads * sockets
- cpus: maxcpus

This is a simple, linear logic that assigns defaults to each argument in
sequence.  At the same time -machine should fail for all invalid
combinations, namely:

- any argument < 1
- any argument > some compile-time value (1024?) to avoid overflows
- cpus % (cores * threads) != 0
- cpus > sockets * cores * threads
- maxcpus != cores * threads * sockets

Alone the last relation shows that requiring all four of maxcpus, cores,
threads and sockets is unnecessary. :)

This will catch situations where assigning a default for sockets doesn't
work well.  For example cores=2,cpus=4,maxcpus=5 will assign
threads=1,sockets=2; then the last relation will fail and QEMU will give
an error.

These invalid combination also make sure that other useful default cases
work.  For example "maxcpus given, sockets and cpus not" works thanks to
the following deduction:

- sockets = cpus/(cores*threads)
- maxcpus = cores*threads*sockets
- because cpus%(cores*threads) must be 0, this gives maxcpus=cpus

-smp should do its legacy magic and assign all five values based on it.
If the results do not match the obvious s/smp/-machine/ command line it
should warn, and perhaps suggest the equivalent -machine command line.
It doesn't have to be a minimal command line, just equivalent.

Apart from this point, these are lovely patches. :)

Paolo
