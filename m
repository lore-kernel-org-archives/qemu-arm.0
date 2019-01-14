Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2882164wrt;
        Mon, 14 Jan 2019 02:28:17 -0800 (PST)
X-Google-Smtp-Source: ALg8bN40VvhCm9J8o6GrVTIcNcGFOn66SA6wNL3UuSbTHdL4f39C6elF2fvLZcY2Rm/C/ZU76f+1
X-Received: by 2002:a7b:c04e:: with SMTP id u14mr10352076wmc.133.1547461697598;
        Mon, 14 Jan 2019 02:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547461697; cv=none;
        d=google.com; s=arc-20160816;
        b=tJiUv4TlUOgmrfulThFQ2yegMGbMDCIezC/ZDYxPl47a6lxZPQAZMA1lNYMcFB+Lt7
         zw8DwwqMCXRAv8dXu/5Bx6XVeiBxpn56PKzb08oCZZvdpEmHK/F/IOusKJq3NSSdBd6q
         AjZf7bmmEo578Pp8dmz+KKRB/2xnAemcJQ8B+jEzecVHDJazkpwl/oIykD1Ndgxr0JJj
         URnh8b/XO1dTYHto60hlLY9sfNpb37f2EiHXUz/W0qSQGF0OUHksZUqcqvQAUobmDXgu
         BbixGMvNPAPspBk6exabLbrdggBlJOS5CdoS5QNljdjRd7RV2PDuFFbP8wrCCLe73Ozz
         2DuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=SL90CNks2+tl3dLlLaGiBIpqZcanGS74z+NzB9PBk44=;
        b=VYUsgMn0jYfVRSgaq6DU4E3iD9fQ19KFdE4z1PQ6FL3fH96SlCAdbdKPTvXl1QBAJU
         78C2+yzTxzXdXbRe0AvmLdmGpzOaSU1aMsTx9EoMLQifoil94h45mk/dm5uNw/f0JPe7
         5V7JFId58SK57hAHnjKBkQuRuhYaWVAYJGcDaBqZ8kVTKuBKls3rXidqxoEvHnClxY2/
         piUas2Agci5ikS+8q/v8ExgQRD9kjt2Tpd3NDq10wZlrXXFRFDfHa9JDCVWUNouWSw+9
         B+ioQusJLXCmEAJmSLzx5MeAXiD9wKQUeULIYQQqTrUIp4nQIAeveFJz4TDVk9usv0CC
         60cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=btvqrTNL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si50002974wri.400.2019.01.14.02.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 02:28:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=btvqrTNL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:38177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gizTc-0001EU-H9
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 05:28:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gizT6-0001B0-RJ
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 05:27:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gizT5-0002qj-4y
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 05:27:43 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gizT4-0002pN-VH
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 05:27:43 -0500
Received: by mail-ot1-x343.google.com with SMTP id u16so18842857otk.8
	for <qemu-devel@nongnu.org>; Mon, 14 Jan 2019 02:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SL90CNks2+tl3dLlLaGiBIpqZcanGS74z+NzB9PBk44=;
	b=btvqrTNLnYX3NT4y4QeT0wigVSdhiEEiO77Cf1hCR73gNRK+g/2v4UjOTMLaWRt6i7
	cqHnyUWzmF4U67Hr5+Icnmw3y/R4zj/4SiPUJ/D/HOsqhDfWTmdLEiTBLNZdU3/0Y0mb
	qCKjs0HiqNenaNNVRL5hUJPcFnKl5kecK9wCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SL90CNks2+tl3dLlLaGiBIpqZcanGS74z+NzB9PBk44=;
	b=DqGomMN6js7RDqfHPIzAjN+iFiXRr+ey7CLb1koALlJr2yz+wPj+JXVZBbLvB6++yv
	jYu/O0CpwWqxCax3IAMp3v/qGSqTkCanB0JCzW8QAavABdHMAERAhn16isnBKJmUer3s
	DHoiEFN7EXLv9477/zl5dOnCohoFxvnTXjs8M+4ektHMO3jOninh1CPUw7VR/K0ytaqO
	bFdxBhJj+ZgiP+yYdb/SbNztqeIl3ltJxLFJm0sxegWrG6h6FaFbkdRQlyiaGqyx7OOE
	QTr+4zosyA9GbfwPjCYxClHhm+MfPTZfr2Wpg1+jfbP4tKHpJ9RAqHp5RIdGThRWQ+8n
	HmqA==
X-Gm-Message-State: AJcUukeN+/IIggrS3+q04rqruc5FvWLPjrMia5DmIGUfuvdK18wA8/9N
	FGzavIW9HN1Oz11hEtkKikR0z9XD0y12apel6lDJZQ==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr15238642oti.151.1547461661961;
	Mon, 14 Jan 2019 02:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-4-peter.maydell@linaro.org>
	<CAL1e-=gtbka64eAhVdbPyLa4+HP-OSQRg7u6+SC-8MCRgoZ9Qw@mail.gmail.com>
In-Reply-To: <CAL1e-=gtbka64eAhVdbPyLa4+HP-OSQRg7u6+SC-8MCRgoZ9Qw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jan 2019 10:27:30 +0000
Message-ID: <CAFEAcA-FoPTcqZ5FH8Si6LUcYZgKVNPfHDBzd=x8QL4x+HDLVA@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 3/4] accel/tcg: Add cluster number to TCG
 TB hash
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"Emilio G . Cota" <cota@braap.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pWpWg4imoZYD

On Mon, 14 Jan 2019 at 01:08, Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
>
>
>
> On Tuesday, January 8, 2019, Peter Maydell <peter.maydell@linaro.org> wro=
te:
>>
>> Include the cluster number in the hash we use to look
>> up TBs. This is important because a TB that is valid
>> for one cluster at a given physical address and set
>> of CPU flags is not necessarily valid for another:
>> the two clusters may have different views of physical
>> memory, or may have different CPU features (eg FPU
>> present or absent).

> I do understand the definition of cluster_index in the sense of this seri=
es. However, it looks to me that the term "cluster" is generally overused i=
n areas where we work. This may lead to some confusion for future developer=
s, and let me suggest some other name, like "tcg_cluster_index" or "tcg_gro=
up_id", or "translation_group_id". Admitedly, they all sound ugly to me too=
. But having the name that would clearly separate this id from too generic =
"cluster_index" IMHO would save lots of time during potential related futur=
e development.
>
> (Needled to say that,  for example, we in MIPS, for multi-core sustems, g=
roup cores in clusters, that actually do not have anything to do with clust=
ers in TCG sense...)

Yeah, the term is a bit overloaded. Arm also has clusters
that are used more in the NUMA sense. However, the
term we have is what is in git master currently...

thanks
-- PMM
