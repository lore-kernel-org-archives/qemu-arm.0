Received: by 10.103.124.15 with SMTP id x15csp213490vsc;
        Fri, 19 May 2017 02:56:41 -0700 (PDT)
X-Received: by 10.200.49.1 with SMTP id g1mr7771328qtb.118.1495187801689;
        Fri, 19 May 2017 02:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495187801; cv=none;
        d=google.com; s=arc-20160816;
        b=DuVFXSvFGcHRYwUMnyQ2KhMteuQYH1jt8uPTPuRqS5T61HbJOe/fBFTxkzUJuhUimW
         jO0acUqfsVQnbcoQoC23yRb3qzTIDlPkHUEFAcOfG/pzFfZUqOCMSNu3bV+5fRDHXbLK
         0T+3meprTxCfR9JkfkmJdzT3YGqxl/bn0ioifUmP30M/L1jbfb80psjReL7mP0WjPg3f
         4r7nobNCvW233uuQjRhpJq/GnSFp/5It1/dILfQ8UXZqxRALgC8Pe5j0MO9h5KAzZQhk
         SO5uK8gxC1LlyD1fAIinhurZbxKI3pBjZkH6o4J+ZqC/E0rFimhSRsBc/a6feVZiW7F8
         w6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ubs7yLiW25D83rqZCgPMITSxVSwxNEBSI6QeWqLVfts=;
        b=Suju8HZJeuiCJnd7Y7V+O67gMrJulZ4NQaEvcT7xEgYlGsqSTxPCdV069iepBt3iHo
         cGaEZw5RRpz/UlIbRWfEKoKhDvPEjqZYv4wOedls/3Z2rLKAKBtEGA+cirFGxViEKk2h
         oBkYGN2tVJ4Ym4z0/GyyvR4eHfyc6pdkrKZTSqOAy2YWN+/P0Uo2M2cwNraDdw310mMj
         ogD0o0zkUfjCb18LssbLIWQHv2aMzZH/AAI8WA/jg85UyMwFnSxqzEFeXfXMwCUTi2mc
         ruYo0uSaCXyFGsdbt6zJY8KMN/8oCsFCZS4otKi1pF43yBdkrD1hbTPz9Fp5RBALcxsK
         FhQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l74si3929287qki.132.2017.05.19.02.56.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 May 2017 02:56:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBeeH-0003gy-9F
	for alex.bennee@linaro.org; Fri, 19 May 2017 05:56:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dBeeA-0003gJ-2V
	for qemu-arm@nongnu.org; Fri, 19 May 2017 05:56:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dBee9-0004zH-EN
	for qemu-arm@nongnu.org; Fri, 19 May 2017 05:56:34 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:33159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1dBee7-0004yc-Gi; Fri, 19 May 2017 05:56:31 -0400
Received: by mail-wr0-x243.google.com with SMTP id w50so2343468wrc.0;
	Fri, 19 May 2017 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ubs7yLiW25D83rqZCgPMITSxVSwxNEBSI6QeWqLVfts=;
	b=k+CUSNvCIP9irw4ovm1puts5pa3mhWfPwF4JUPU7mAE1A8qsTKBj9pMdWbU+U6Cxs4
	q1EQ64EgBP4IA8p4EjdqAdYnAL1G4iQUqaA4FR3SNAFXcCLcLstcg5cs/lBOs0Vgy96P
	LHuXLJlN7JWBtgFbJ3J+bq2zWqB03CbJ69Qu67nylM0usK1OnEr3rFAHh7jdT2WF/kDk
	Z0MK6cOARI04HWWZw54QxwtP7LPPbt2DpioyqsA5nenRX/blsxjoIZv8Tv2kPJ1qiFXx
	gAYkf4kUSmaluTe0MNTp1IkG2ejPtLx6Vb5DQInTErfYMqUUlNRNnWfyz2bLjGeySud5
	aKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ubs7yLiW25D83rqZCgPMITSxVSwxNEBSI6QeWqLVfts=;
	b=LAVCOQdEoxWXqIVCmoJ2NmTR3p622un5/ecbsLTadT6otzMyEQH1NeFQGMhkcLPVLg
	7mQAOE+AqLfHaaWgfeb4mAnZgL8yeTEoht/YCV/hsgJBHYfjk8q+QGU3IPQK4MHhopop
	+25X49rdV0pFN+nGMTDrlmMsIky8ojOfH/BZoLuqNixjcmdlupg2c4PNdIwowp7jfGTk
	EITRjFsDyym2gxrsO6Lu2MllDazRFJ1lFMtCO2VAEqc62lexU/iM117H+l9G3fgN85Ia
	3+9f9sseC95+2WMB8aSDjOdj9/bUVvhYYh5a6Af4JTM54rQl7ujy6PzglgXsdDTdX6Ua
	LhvQ==
X-Gm-Message-State: AODbwcAq7MkhPxQ3WlJvyH+H5qgGAX0caygL0yMBsZcSRCxA0OfGXwSN
	v0rz5LhZk6b2UdSr9XtGjNlfgG/dlQ==
X-Received: by 10.223.173.131 with SMTP id w3mr2375068wrc.125.1495187790364;
	Fri, 19 May 2017 02:56:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.150.50 with HTTP; Fri, 19 May 2017 02:56:29 -0700 (PDT)
In-Reply-To: <20170518182039.GO4748@thinpad.lan.raisama.net>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
	<1495094971-177754-4-git-send-email-imammedo@redhat.com>
	<20170518182039.GO4748@thinpad.lan.raisama.net>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 19 May 2017 10:56:29 +0100
Message-ID: <CAJSP0QUzOv0S8dPthgs-sYnoZ0fB8BDhPJ85+cvcSjpuXkGzWQ@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] numa: silence incomplete
 mapping warning under qtest
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
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jbdYnhyy7k7a

On Thu, May 18, 2017 at 7:20 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Thu, May 18, 2017 at 10:09:31AM +0200, Igor Mammedov wrote:
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>
> Where exactly is the test code that triggers those messages and
> requires this patch? I would like to document that in the commit
> message.

$ make V=1 check
TEST: tests/numa-test... (pid=30376)
  /x86_64/numa/mon/default:                                            OK
  /x86_64/numa/mon/cpus/explicit:                                      OK
  /x86_64/numa/mon/cpus/partial:
qemu-system-x86_64: warning: CPU(s) not present in any NUMA nodes: CPU
2 [socket-id: 2, core-id: 0, thread-id: 0], CPU 3 [socket-id: 3,
core-id: 0, thread-id: 0], CPU 6 [socket-id: 6, core-id: 0, thread-id:
0], CPU 7 [socket-id: 7, core-id: 0, thread-id: 0]
qemu-system-x86_64: warning: All CPU(s) up to maxcpus should be
described in NUMA config, ability to start up with partial NUMA
mappings is obsoleted and will be removed in future
OK
