Received: by 10.25.227.6 with SMTP id a6csp1259917lfh;
        Mon, 26 Jun 2017 19:33:52 -0700 (PDT)
X-Received: by 10.237.41.132 with SMTP id o4mr3901433qtd.242.1498530832076;
        Mon, 26 Jun 2017 19:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498530832; cv=none;
        d=google.com; s=arc-20160816;
        b=VPFjkemvzTLdZUilgoLxUfc9lZ5XToRGaBB8xHJHEXJeM9ZZn17J+CnKc7AlO0MGt1
         06gzblfVNz5a0i5HrT2RnnZhYZqB16mNPTzW2ZJkwyHAHpJ6tx/1/7d8ilnPiQokuudr
         fp/PTrc8MXZPsxBoUQw6slJywjU6Esc+WcEtcGXSDEJxk94tgk9eIKbfhajsDUr1qrTx
         gcjopG8PKaVQguurBnMnSt4pUnQ6gdwAZmhN0w5dTytFq1UbPKyLgTINnz4NyjZQoxyT
         2EsdnHbJ1LNcor1X45uWWnUC9o+icFXXmj3KgCTQyH/PxPZCPRte1d9oPeMIidxQmvGi
         4s/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=jt3h1LQkXeNbyrfiurFmVWaelmyO0FQU1z3N3DoUrkQ=;
        b=zTtguQkDVuEn1NxXOIq36hYKhheP7+ydiNd2dpeLvjStGzH6JHi/Idi8o6zHhdiEhv
         1T29lnzksznti4vi2TxNm2LR/Sdwc1Vm1HKeYQiRyt1g5ag6E0jeW+41n1LXyDp/ZmxN
         eZ/hSNbD5xLhxdz7CjY+RRixGUnvXLy98iS1JIOD3Qf3hGR/CcwNAjyuMWO2y/S58C8V
         m5Y4tykOPByMVb+sDRj19u9Qcb9zvgMxkAvcu8W5tsy9g/3+6r5Az4PHMmiYHWNvAhJ6
         UZuKyrRUv5nK6o0Lfi9+a5cbuSdJ7p8cXEKeuYezHhqRYAfJTepMeVrxIqg6nVzB1jpw
         ezrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=ehabkost@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <ehabkost@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 51si1625485qtr.72.2017.06.26.19.33.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jun 2017 19:33:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=ehabkost@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 013E07F6AC;
	Tue, 27 Jun 2017 02:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 013E07F6AC
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 013E07F6AC
Received: from localhost (ovpn-116-2.gru2.redhat.com [10.97.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FD2E7EDCD;
	Tue, 27 Jun 2017 02:33:50 +0000 (UTC)
Date: Mon, 26 Jun 2017 23:33:48 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 0/4] cpu: Implement cpu_generic_new()
Message-ID: <20170627023348.GU12152@localhost.localdomain>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
 <87a84uyj2q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a84uyj2q.fsf@linaro.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 27 Jun 2017 02:33:51 +0000 (UTC)
X-TUID: D+64EqDgsvG3

On Mon, Jun 26, 2017 at 02:28:13PM +0100, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > This patchset adds a new function cpu_generic_new()
> > which is similar to cpu_generic_init() except that it
> > does not realize the created CPU object. This means that
> > board code can do a "new cpu; set QOM properties; realize"
> > sequence without having to do all the work of splitting
> > the CPU model string and calling parse_features by hand.
> 
> 
> Just going through my review queue and I see this needs re-basing. Is
> there going to be another rev or was a different approach suggested?

The right way to go is not clear.  We know we want to remove duplication
of CPU creation code, but probably we should first refactor the -cpu
parsing code, so parsing happens: 1) only once; 2) earlier in main(),
preferably before machine->init() runs; 3) inside generic code instead
of arch-specific code; 4) preferably using the QemuOpts parser instead
of the current strtok()-based custom parsers.

After the parsing code mess is sorted out, writing a generic CPU
creation wrapper will probably be easier (and safer).

-- 
Eduardo
