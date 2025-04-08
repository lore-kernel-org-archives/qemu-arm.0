Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6900810njd;
        Tue, 8 Apr 2025 01:59:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWb8zYk/fFd8xfdH+Zsg+dPCcPMq9ojeAubV4iV4z4+FO6VowxaU6OybLEU+or8wu91Bq10HQsiCQK55Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFLOjfTMDo/Go0SF36fOoJIYY6W/jNF5bROCwKLWXWolX8fqTBfZ797CinTOQYYPBNRzYkT
X-Received: by 2002:a05:622a:5c8:b0:476:abd1:7101 with SMTP id d75a77b69052e-479249c71c7mr234404511cf.46.1744102789715;
        Tue, 08 Apr 2025 01:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744102789; cv=none;
        d=google.com; s=arc-20240605;
        b=FHO18k4bcoRKBavUSd6TlggupFukhaUkD7V16uKWCFlSghea2jQQLZHgwvcTpBcEpF
         kmbvkSekw/zztbhmGOt1TW8Xt/obzkCumA+9VuAbj7wdLe+6vze+9gFmCaiEogu/fmKf
         ctc7bpFIyTxpX41hYchWO2tZhJghvxPyaNvV4sCIluFaZMIZ8Zo/IIMyEY13My8SDbGy
         fL2OJ0ED8V2dXqsFCZlTMUqdO937oqIHmiyI0Z36Oca417MkBszq70MXzoB3ddqHw9hu
         IrQvub3Up4m7QqEyBHm5C84VvNIJ1hQyI0uBzk2kGR+yp2NiaYQnTjoD0nDueHqrWzcU
         lBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=klJmLnTKyCJxjGC3qBlI/eGBvIPAZJnlyZsGJ1NoYv8=;
        fh=WU88N4mKJ15KAWPL9VYIv7nZ1xzpFNrIIDVdluAAoJ4=;
        b=PHgA4gBNAOoUBzjEMMd7tTvEuPKWkfro3b32pq091sLPLyfvuQgNd1tOVZ4Nzf45DQ
         XAun7iv8k1S6sja8YeiHddMPV89ZmFuBY4TqgiAeG+goyEonaxi2jltZDRouu6lztjqe
         k/3Ni3GFG7RBCRvHaOSN6Djd3aIh8moI9de4LGqBz2QintPqZ2DqoH1enlJ5X49vO81S
         697b6AuMWOb5x5Lc/0drCx89tkep7MMjhfhTufjtMu6ZI4dtcraMLwcn1zKM7zhF2+hx
         pcinDV5SOjRaDDdtlW4fa7bZKJFsW2m615L1Ruu51yQohgWf0mGR+ZisVF7S7A7hbsY+
         ZIWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4791b176702si101420841cf.305.2025.04.08.01.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Apr 2025 01:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u24nz-0004FG-NL; Tue, 08 Apr 2025 04:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u24nr-0004EW-1J; Tue, 08 Apr 2025 04:59:32 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u24no-0004AY-43; Tue, 08 Apr 2025 04:59:30 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZX0KK3ScZz6M4lS;
 Tue,  8 Apr 2025 16:55:33 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 76CA21400DB;
 Tue,  8 Apr 2025 16:59:20 +0800 (CST)
Received: from localhost (10.203.177.99) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 8 Apr
 2025 10:59:19 +0200
Date: Tue, 8 Apr 2025 09:59:14 +0100
To: Eric Auger <eric.auger@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
 <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>,
 <shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH v8 5/6] tests/qtest/bios-table-test: testing new ARM
 ACPI PPTT topology
Message-ID: <20250408095914.00003995.alireza.sanaee@huawei.com>
In-Reply-To: <03409a9d-fbee-4e08-9ca3-861bf8eddd55@redhat.com>
References: <20250310162337.844-1-alireza.sanaee@huawei.com>
 <20250310162337.844-6-alireza.sanaee@huawei.com>
 <03409a9d-fbee-4e08-9ca3-861bf8eddd55@redhat.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U1lgwDVQ0wLU

On Mon, 7 Apr 2025 19:30:47 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Hi,
> 
> On 3/10/25 5:23 PM, Alireza Sanaee via wrote:
> > Test new PPTT topolopy with cache representation.
> >
> > Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  tests/qtest/bios-tables-test.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tests/qtest/bios-tables-test.c
> > b/tests/qtest/bios-tables-test.c index 0a333ec43536..6bdc25f4df1e
> > 100644 --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -2142,6 +2142,10 @@ static void
> > test_acpi_aarch64_virt_tcg_topology(void) };
> >  
> >      test_acpi_one("-cpu cortex-a57 "
> > +                  "-M
> > virt,smp-cache.0.cache=l1i,smp-cache.0.topology=cluster,"
> > +
> > "smp-cache.1.cache=l1d,smp-cache.1.topology=cluster,"
> > +
> > "smp-cache.2.cache=l2,smp-cache.2.topology=cluster,"
> > +
> > "smp-cache.3.cache=l3,smp-cache.3.topology=cluster "  
> In the coverletter you used different topologies: core, cluster,
> socket. Don't you want to test the same config here?

The reason I used this one is because it is a weird setup (everything
shared at Cluster) and if this one works, I can sorta say the rest of
the scenarios work fine too. I get that this differs from the cover
letter setup.

I could also add a single test for all combinations of caches. 
They are quite a few. But then I would be happy to do if I should.
> 
> Is it better to reuse the existing ".topology" variant or to create
> another one? (I have no strong opinion though)
I am not sure how to do variants and I just replaced the existing one, 
but happy to do either way.
> 
> Thanks
> 
> Eric
> >                    "-smp sockets=1,clusters=2,cores=2,threads=2",
> > &data); free_test_data(&data);
> >  }  
> 
> 

