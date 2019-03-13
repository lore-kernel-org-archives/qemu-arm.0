Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1444584wrs;
        Wed, 13 Mar 2019 02:49:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6G7i5y+sCqB0sc0H6PDOb333YTcsS2pNHvb6USRh1rR9mrcp1KHyjkz2WGB5rbLtIke3X
X-Received: by 2002:a81:9342:: with SMTP id k63mr13687876ywg.311.1552470587063;
        Wed, 13 Mar 2019 02:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552470587; cv=none;
        d=google.com; s=arc-20160816;
        b=HqcpGKYn0oYM5foRMSUI6EbkImqtpF2T3YuIetIR7hZVTPFS1wJ2RRrLmJYyS14XiT
         mhccXpYVIXBeGdpmsUe+k2YPC+cgakTB/EHj+mg/3ruWgO26FBg+3p5JKaPhsRBgxAo5
         sE2NLIe9yA8fkrzr/4cwzTF4/mStyZFOuVAe+6by2ujB7RzwyEE+FUNSQvZQqu/9l1Cg
         vJ9yJAY7ss0VeArkYFbkVczYKWuvN6u4zf3oPWRPj4z654P3szryozf4hFkzIZ3A8Bp6
         12xAeMc+svA0l5S2AS8M7mbBoAWmKYI+MqyvSzfEVZOyBeOYMhFM1xkE8PjkgWX29EcO
         hOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=t4dpb0JUzmOqhzPIH1iDXfsb2Db+XqKwOFBk6EdyaZM=;
        b=KYt85OTV2y2d9yyhkZZWV20WX0TmksXeglfBxzY1JhiZmdSAEoNWxfhZcO+AYQg1ov
         4CSlAMfYKxIcEopF2JF3nVkfS2aL9xhMJcV0lvDyXbJqptU0MQxmOFjZBhX0nDTi3m7R
         fEf72DaZyzI1tsFELcNlZsFatE9BvdJGfVQZlXborhxEHkxGKgxKzsOmWjz0KnrfLph5
         Q0gIw/OISiWUtwlC1ylDnKjWEVxBFjXQqW3r7WrE/tQ0a2EFDPjoZJRziXnvgIXTFn1J
         9j5hXY7BQ52bjqAPbHvrmboPHBki5jcBtVcAodn0UWCHt1zeoN8gBSrdpBmjamX8sXKS
         1Tcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si6533192ywd.395.2019.03.13.02.49.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 02:49:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h40WA-0004Wc-IS
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 05:49:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h40R1-0000a0-0U
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 05:44:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h40BZ-0004nR-Rd
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 05:28:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49668)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h40BY-0004n3-Mp; Wed, 13 Mar 2019 05:28:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03EC33001C8C;
	Wed, 13 Mar 2019 09:28:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D75B4139;
	Wed, 13 Mar 2019 09:28:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1A8EB11385E4; Wed, 13 Mar 2019 10:28:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190312225632.29777-1-philmd@redhat.com>
Date: Wed, 13 Mar 2019 10:28:20 +0100
In-Reply-To: <20190312225632.29777-1-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue,
	12 Mar 2019 23:56:28 +0100")
Message-ID: <87ef7bgm2z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 13 Mar 2019 09:28:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 0/4] fw_cfg: Add
 edk2_add_host_crypto_policy()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YtAIle+xykQ/

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi,
>
> This series consists of:
> - add fw_cfg_add_file_from_host()
> - add edk2_add_host_crypto_policy() and the Edk2Crypto object
>
> The Edk2Crypto object is used to hold configuration values specific
> to EDK2.
>
> The edk2_add_host_crypto_policy() function loads crypto policies
> from the host, and register them as fw_cfg named file items.
>
> So far only the 'https' policy is supported.
>
> A usercase example is the 'HTTPS Boof' feature of OVMF [*].
>
> Usage example:
>
> $ qemu-system-x86_64 \
>     --object edk2_crypto,id=3Dhttps,\
>         ciphers=3D/etc/crypto-policies/back-ends/openssl.config,\
>         cacerts=3D/etc/pki/ca-trust/extracted/edk2/cacerts.bin
>
> (On Fedora these files are provided by the ca-certificates and
> crypto-policies packages).
>
> [*]: https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
>
> Since v3:
> - Addressed Markus' comments (do not care about heap)
> Since v2:
> - Split of
> Since v1:
> - Addressed Michael and Laszlo comments.
>
> Please review,

I can't pass judgement on the feature's utility, but the code looks sane
to me.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
