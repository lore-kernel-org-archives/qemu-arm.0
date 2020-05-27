Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1123531lfc;
        Wed, 27 May 2020 07:28:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2xGuQADPgmwt594n7fHZI3jWpOgwQmx91weuSiT5Ex+GalxIrXyt3ceZK0mn8amy4NHnE
X-Received: by 2002:a37:684:: with SMTP id 126mr4191825qkg.486.1590589690047;
        Wed, 27 May 2020 07:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590589690; cv=none;
        d=google.com; s=arc-20160816;
        b=PFLq43fvRvPbuJ22u+oBTu9qD+DXuQ87efgvR1YvpfqcnlG2W2x06brxIT9TUJvtW4
         dBy1C/0wu4ogkDlg7UkRB407TTo0jdNYJnxokPTNTvDc+9bWhH9JgDSa59OcWkRCzXaH
         bMjoob7on7VvvH9Hzwh8hVndQGtNW+4CrjEWvzG2+jWv+JzgEIMf6Y8rGVMgD4UFdLYW
         iffD9x1aoHiy7YyM/j9mRgY0ZfMMZ/9xaDRG3lCJP7C6CdG/II8rf9screPliSC4QMPj
         bxiXfFkWEYFR3ssRYj67Y82fjrsqNx8A1ClXlEo+GY7OaFMNesuzcAHrKLbLgEQZ+EDH
         eSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=VrWprPAO2g9tzHluqg3z57znAzq/VXHPk2BeKdOgc/M=;
        b=0NYfyJTN1UA2OFHfxh8QYH+jW8TsdehxzM2lrIX8K2TzWXEWjzH2ZcXcBp6WGMgKYb
         k5ZLXEj3P66646HoRx1nWCiy1PB/CxuzRwOkJ96iDjow0zKipEXT30tM26DXu9mW7RPg
         9jFi7o+y6bXbPq7BxO71AylgEbk5jF6SxcAE8tg2L2aGqzGbCIkM+AXv08dX6iqUacob
         fvow/HbjpqUt2ZUXS4pKrI+TnCg6DBc18+M4HI2egALvpm3RqnC8MQJ/Q+1F6Xl1y93h
         iqMWlNXFoySFS1ORXuFRpQ9UNDntK+3COV54/lY7k9Q6l0EBSBIL46MoBbezlFDoN+7u
         Mrww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KOYD0n91;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si1603007qtk.86.2020.05.27.07.28.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 07:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KOYD0n91;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdx2P-0004Wy-Ei
	for alex.bennee@linaro.org; Wed, 27 May 2020 10:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jdx1Z-00046L-KX
 for qemu-devel@nongnu.org; Wed, 27 May 2020 10:27:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40062
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jdx1Y-0003kC-Cy
 for qemu-devel@nongnu.org; Wed, 27 May 2020 10:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590589635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VrWprPAO2g9tzHluqg3z57znAzq/VXHPk2BeKdOgc/M=;
 b=KOYD0n91ZvB6Ga0SJpPmure6VI42W6+bOCRwnsFd8GLvBAk7J4bq4xtJcAmJru616qpdV/
 6GZPlIb3HcaRY6Vsjte2oS37Xmod2ryjuyfF1kbjLwVox++gUggcBvrDz+ojm7d+VSywDe
 ifvHnZaCyxm2hz7hc1epACErjbkva0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-Kofn5phbOhGrQFn4AYcYbg-1; Wed, 27 May 2020 10:27:11 -0400
X-MC-Unique: Kofn5phbOhGrQFn4AYcYbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA4C885B680;
 Wed, 27 May 2020 14:27:09 +0000 (UTC)
Received: from localhost (unknown [10.40.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A3907A8C2;
 Wed, 27 May 2020 14:26:49 +0000 (UTC)
Date: Wed, 27 May 2020 16:26:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 14/22] microvm: use 2G split unconditionally
Message-ID: <20200527162646.694b2d47@redhat.com>
In-Reply-To: <58ced517-1ad4-c895-afe6-fec690791f4f@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-15-kraxel@redhat.com>
 <20200521112921.641f12bb@redhat.com>
 <20200525114508.hhvyzjiqja6knz6l@sirius.home.kraxel.org>
 <20200525183615.5f8e67d3@redhat.com>
 <20200526044839.bncj6iltugnzgfmy@sirius.home.kraxel.org>
 <20200527142545.32e91049@redhat.com>
 <58ced517-1ad4-c895-afe6-fec690791f4f@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 01:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OMp2tfEXWGws

On Wed, 27 May 2020 15:06:28 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 27/05/20 14:25, Igor Mammedov wrote:
> >>   (2) we loose a gigabyte page.  
> >           I'm not sure waht exactly we loose in this case.
> >           Lets assume we allocating guest 5G of continuous RAM using 1G huge pages,
> >           in this case I'd think that on host side MMIO overlay won't affect RAM blob
> >           on guest side pagetables will be fragmented due to MMIO holes, but guest still
> >           could use huge pages smaller ones in fragmented area and 1G where there is no fragmentation.  
> 
> Access to the 3G-4G area would not be able to use 1G EPT pages.
Could it use 2Mb pages instead of 1Gb?
Do we really care about 1 gigabyte huge page in microvm intended usecase?
(fast starting VMs for microservices like FaaS, which unlikely would use much memory to begin with)

> But why use 2G split instead of 3G?  There's only very little MMIO and
> no PCI hole (including no huge MMCONFIG BAR) on microvm.
> 
> Paolo
> 

