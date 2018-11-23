Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2395364wrt;
        Fri, 23 Nov 2018 10:35:51 -0800 (PST)
X-Google-Smtp-Source: AJdET5fAL0B91pmkOSfNGwKsgLM+q1W73QQLikBYQQFYgafxXzAAXQLK/+ZjEAh7AZ1ahHOdBJUa
X-Received: by 2002:a81:36d8:: with SMTP id d207-v6mr18049040ywa.71.1542998151465;
        Fri, 23 Nov 2018 10:35:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542998151; cv=none;
        d=google.com; s=arc-20160816;
        b=UelyWhnU1ufF7rQAG09eIDQ71WYJxBHp38ciOGdWl3ww1Ix2i4eSb+6p4I1/mQTzdL
         e8fGGFN/p3HLPClfWWx7m0dSzKEV9w6/E2k0WGtFjlx6vYX+RZXev/NmIcFRpnDFrWDo
         7wgY0XB2cpSjxBOc5dkR7tyH9YHNYVQcOONZqAf+1FE5L5g4uPQx97hRhJa+O1q8OPdG
         GXDWvRz2A27Q/Kqq6UHC32xUYVdFc4TeoFOeNS4MVe18cY23flNZH2wUx+N9iOsSpdeN
         dAggivL1NKKGgaG/OZcL50Z+3AcDTu68HJWrUdspnazJNk1lpwDCwWz2VojxqBHrEsY3
         LrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=1y9e5ZjQ7O8xxZch0LhsdPe7o2TB3d5w12yeOqfiRhY=;
        b=f59SgMCpuZjXXDJAMvhGIB8FXxL+W6HMwH1DoAyd64lUTRwXPVUdGu9i2owTAW6hDT
         PtXWJt85hRb8wIlpDa8q0Y47mce3yZJe682SbzECBuZTBywfkrSYopzxY+ZlRvLS8tfm
         nfeuarNZfPfdLk6W4aqpbiJe68Nr6/07Tx7vrrfOlYOS+1wgw0kVat5EsNG5yG4HUwjS
         t1vxUjntFSsmyFv2l9UGkK3Nvm9OM0oJ2OuFOy3PIOGm32h9PMzJdUyVqcCdbNlFjl1W
         B1TVNsU3srrUxserYwAFoixlRZty+7KGl318+RI0uEtU8R12T02qwfHAMbT90l61cV/4
         dfXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RBCD68bk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w22si16569350ywa.430.2018.11.23.10.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 10:35:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RBCD68bk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQGIw-0008Hh-SI
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 13:35:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gQGDF-0003sR-MI
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 13:29:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gQFyT-000624-1m
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 13:14:42 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40332)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gQFyS-000613-Ju
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 13:14:40 -0500
Received: by mail-oi1-x241.google.com with SMTP id t204so10611674oie.7
	for <qemu-devel@nongnu.org>; Fri, 23 Nov 2018 10:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1y9e5ZjQ7O8xxZch0LhsdPe7o2TB3d5w12yeOqfiRhY=;
	b=RBCD68bk3hWi8okXohGl+w9Oz8XqvymfhZMIrJtWHGjTTWep1Ujq0n2pRldmjoidRf
	u8Pr6WadXf1eBs9sQOnj5NMM89IKn/Q6VJTcrE5HGSwkCoT3P1BnBJujo+lG8p1xnO67
	WNEFmbDSwDT/xcbPigbFmLf2VWItHxKqKclwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1y9e5ZjQ7O8xxZch0LhsdPe7o2TB3d5w12yeOqfiRhY=;
	b=kZH8WKZa/JNmSJ85tCZqo0k7zZ98dW9ARLKRsCBsS5fiv58l32Q14aNrzKuDpaXJzx
	7q5qG94eSKQFU06l4+QWBQZTlq/Pw2P7/WNUFCzyr1SkoPYbycxC6dhJgMc4YxiXVbGO
	YeJedaLJ4viAahn3FR9DcrRLHHy10TO7h2XImYngiSRsNyTdy2xEOJzwO8NntEcZ9/Qc
	qcyHeObmYyfDsiSkRtOOt0XwGOuLAj/NZzmxOkndWoW93f25nnSbC3D1h0qmYBOJXER3
	xImX+agQV32UtptrIWQwdwt8w+ZT7Kwy6z56mbn9NcR5B/lOe65gM031LbFLJu/6orX4
	zEyQ==
X-Gm-Message-State: AGRZ1gKhqAw3/zzuYmbez+X67JloEwql6WUQSVu10j9BG+r4OgWfsthB
	gFlmRtMKWDDC+WAQIixthJgv6J0htnYO9nCF27ahsQ==
X-Received: by 2002:aca:fd12:: with SMTP id
	b18-v6mr9559437oii.337.1542996879845; 
	Fri, 23 Nov 2018 10:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
In-Reply-To: <20181123181059.GN18284@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Nov 2018 18:14:28 +0000
Message-ID: <CAFEAcA_8jJz5dE7XP4R=LjEC5WzP3jzutg=YqiYjJVwZZz+jvQ@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU clusters
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JSsMaR7vTPfB

On Fri, 23 Nov 2018 at 18:11, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Fri, Nov 23, 2018 at 10:17:14AM +0100, Luc Michel wrote:
> > This commit adds the cpu-cluster type. It aims at gathering CPUs from
> > the same cluster in a machine.
> >
> > For now it only has a `cluster-id` property.
> >
> > Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> [...]
> > +static void cpu_cluster_init(Object *obj)
> > +{
> > +    static uint32_t cluster_id_auto_increment;
> > +    CPUClusterState *cluster =3D CPU_CLUSTER(obj);
> > +
> > +    cluster->cluster_id =3D cluster_id_auto_increment++;
>
> I see that you implemented this after a suggestion from Philippe,
> but I'm worried about this kind of side-effect on object/device
> code.  I'm afraid this will bite us back in the future.  We were
> bitten by problems caused by automatic cpu_index assignment on
> CPU instance_init, and we took a while to fix that.
>
> If you really want to do this and assign cluster_id
> automatically, please do it on realize, where it won't have
> unexpected side-effects after a simple `qom-list-properties` QMP
> command.
>
> I would also add a huge warning above the cluster_id field
> declaration, mentioning that the field is not supposed to be used
> for anything except debugging.  I think there's a large risk of
> people trying to reuse the field incorrectly, just like cpu_index
> was reused for multiple (conflicting) purposes in the past.

One thing I would like to do with this new "cpu cluster"
concept is to use it to handle a problem we have at the
moment with TCG, where we assume all CPUs have the same
view of physical memory (and so if CPU A executes from physical
address X it can share translated code with CPU B executing
from physical address X). The idea is that we should include
the CPU cluster number in the TCG hash key that we use to
look up cached translation blocks, so that only CPUs in
the same cluster (assumed to have the same view of memory
and to be identical) share TBs.

If we don't have a unique integer key for the cluster, what
should we use instead ?

thanks
-- PMM
