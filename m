Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1956921wrt;
        Wed, 21 Nov 2018 06:44:45 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VsAFOfgW73JuCQAIG3Ov0+tmtq7fCclMjjlcfdHqJ1IUCZs2OPIkx4z6aguhSqOC9dzLMu
X-Received: by 2002:a81:b542:: with SMTP id c2mr2383518ywk.268.1542811485326;
        Wed, 21 Nov 2018 06:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542811485; cv=none;
        d=google.com; s=arc-20160816;
        b=SahTg6hjCKWGe4kjMhIkDGSA2hk2vyj6LvdaeBir91M2Hu10iMo9h1QZ/kmu6z//8N
         guvc/UrubW/Ghnkgxo16i37P6uqgv/56QGRUAP9sE8E3OcuGIlrUb8JRT0ZDNda/d2rp
         hX+XXXOJJQW94fUSR/s7Y1/wJAP0JlhTMiB9ORr5mAg9WOzrfjpn1s3iBDiS8QAIBhaB
         ohxES2IJtl1MnyIIUeF/uA3WJLGud2T8LHC0RDmDlLAhY34pzeBboEoRoCjicgPuYIlb
         cu/QnKig4rUVhhjGojwnN2zPSEeMMVjXpETtPPXY1l2f228JnADs2Aoa8vfQ6pd97isv
         sAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=6/+WRVBixOB7N02IlehYRZtZgLLMhOyb8qva7+X+KCo=;
        b=dTIMSo7jYkDGu6ePg+k1Jb1wFLMn3bCy78+yCDraLNMRUVYbg8PjlN3ayi0RuTPdvx
         /oCs/lVKisRsixK8Ea+HDkLMmiyks/cWCiC/WJja65LszywXKETMoMqMMYs6BVEm3/iE
         FfVpiIXVUETaB7sqzwDbH00TWiOEig0+48uuMVz9gaNgjh53jgo7Jf4QKfrD7eZmJqnQ
         pbceyj9E+S6qZmMJVmXZDY3JaUJLdMg4aW+26T6ru44+MJLvIU2HLbyJHnS3TGq+bGto
         ZjcRKUDN21/gdu2MkEcL9zl3sGZ8L/qm/EoZNTFJvv7dNs9D9PPJSXcEqTz057JpKqHp
         nNPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t12-v6si29382835ybi.484.2018.11.21.06.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 06:44:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:39551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPTkC-0001s6-PD
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 09:44:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPTj3-000196-Nf
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 09:43:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPTiz-0001Vj-Pa
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 09:43:33 -0500
Received: from mga06.intel.com ([134.134.136.31]:64823)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPTiz-0001Uy-FD; Wed, 21 Nov 2018 09:43:29 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 06:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,261,1539673200"; d="scan'208";a="106527432"
Received: from tterrive-mobl2.ger.corp.intel.com (HELO caravaggio)
	([10.252.4.181])
	by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2018 06:43:24 -0800
Date: Wed, 21 Nov 2018 15:42:50 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181121144250.GG4426@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-3-sameo@linux.intel.com>
	<20181109152716.236d3c6e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181109152716.236d3c6e@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: Re: [Qemu-arm] [PATCH v5 02/24] hw: acpi: Export ACPI build
 alignment API
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w0yCbdNQCKhq

On Fri, Nov 09, 2018 at 03:27:16PM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:25 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > This is going to be needed by the Hardware-reduced ACPI routines.
> > 
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> the patch is probably misplaced withing series,
> if there is an external user within this series then this patch should
> be squashed there, otherwise it doesn't belong to this series.
hw/acpi/reduced.c needs it, I forgot to remove that patch when removing
the hardware-reduced code from the serie. I will remove it.

Cheers,
Samuel.
