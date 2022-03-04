Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1471532lfo;
        Fri, 4 Mar 2022 02:57:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1ajkcsC3CeJLFNMcCg02MimHcJB7zSqkmZsMFgGw6sK1sDeHgax9W74mYjzSe2j14Fha/
X-Received: by 2002:a05:6902:20e:b0:627:f1cb:a9ee with SMTP id j14-20020a056902020e00b00627f1cba9eemr29553588ybs.129.1646391459666;
        Fri, 04 Mar 2022 02:57:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646391459; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4+JK/5GLqC4mso4EhkZBwimBNzqvBaH51tlbmqPbrIo/KgjLFyfILX66LjiZap8Fo
         kYbPCO/oa9AptOgeKYkzjH4OeDgbDtON7zGDGGDlAAsQJ5pq+JLYkg8o7b7uU1FWe7xt
         0h6LUiT6B8RBm5xt2v4QcuWNKeN3XD2s8TW1GfiyWQM10vkyvOdoQhVMvQKOV1zxxSxE
         nWf8ZVOu9jmtGPMxcJWXVBa+YobZlPEgrkLt++ip4LLegg1TnxF/rPnmqhFpgom0lgxx
         rckg/EVS5vFdvPWNFUYCXZG8gp7TD+/QNy8syKIvxBEpen0QI+XtpOxD8cM+31BDrsUO
         Y5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=qPCKhliNjC5w/vPfb/TAz8BmgaV2mxuagBwPeoitokg=;
        b=z2odWA65DGU01onaDDhc36x7HqMNLpH1DFY5gB3VYnV2DXKdYW/bXOnTYV4PQYHGt4
         OHFMywC8EYwofzbj/21MVV+f5DvOdlhK2daRzdjjTinuLG9p+Zl1rZzn09NmeLfkQXEr
         gYOK2WU6rpKYX97T+CW315vF57lg2tn1PVsNneRqOZPp8EVM8MPLpb6FXCkLZtC5CyTc
         mVpP12S/hruH2xdWNP/kcPX1EAKLnSfQgd2KQj+a2YgwIOw8suVUxlnYM5joXH/J7jkU
         FetNHwE88cuEbOweCrLAxFAqkyDVCM5YzxlUqLag/pmADtJG7n3bYp6hYt5VjhfZG7w/
         uelQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DaM8t4Lm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s75-20020a25774e000000b00628762f49fbsi4063539ybc.160.2022.03.04.02.57.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 02:57:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DaM8t4Lm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQ5cx-0001CU-2s
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 05:57:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nQ5YF-0004vx-6P
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 05:52:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nQ5YD-0003d6-Jj
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 05:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646391165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPCKhliNjC5w/vPfb/TAz8BmgaV2mxuagBwPeoitokg=;
 b=DaM8t4LmXv+MmGxp0AvejJK0kVMB1sBc/meuPA6zIJNI2ALhjhSKShRKqYY9NJk80jTJbo
 9o7GoHZP8XD+lIiW6bIyWoOFd5WObRA+LM8K6OnBd1J9T1xWVZrFIy2h+WT+LqT3pmzvXj
 wln/h/sdY0F+3yodaz1bjEDl3fTQkoo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-jSO-KZPdMqu-XgyczdcjwA-1; Fri, 04 Mar 2022 05:52:44 -0500
X-MC-Unique: jSO-KZPdMqu-XgyczdcjwA-1
Received: by mail-ej1-f70.google.com with SMTP id
 i14-20020a17090639ce00b006dabe6a112fso502824eje.13
 for <qemu-arm@nongnu.org>; Fri, 04 Mar 2022 02:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qPCKhliNjC5w/vPfb/TAz8BmgaV2mxuagBwPeoitokg=;
 b=CRvlpvZye8PiyRO2QQQVHF0Ylz+Z4++LxTlMzpg1ZuDkCOrhvPX5HRPgm6K52vRTGz
 5lOwJJGqmwRADQDEqcv6XLWFaxkUiR4EAaUlcwNVBsdoMf+7VQ8FnxlDXEx4sBjtbO4p
 fyYqw6Z4taRNAfz1iTu+Wsz8VMbfINlRbEbOKjwOlwoFCSVDG64m8zB80xhIvwt9MRuj
 0UFw5FDDe+AfqTnbXMs0tCgGsBm58vKwL9tMF1f7nDoB9+Q3GW0UD8d4s0jJDTJKlGRf
 Ftg8n9Gq5j16lu2PIFRk59RXBByHT0eTpyPF2lWeXEYW3H34g7Ba7eI7mJTgvxVfFQib
 CAPQ==
X-Gm-Message-State: AOAM531P6zx/0m2TrU9j3zF7bxqIQu1b5/ZcvKZKAFAQ2jSUuvkNefbx
 fAwKd3zkKq6MUiBiPFnGSQrmBuNF5G0KnPUpk37VCBF/gNyeK/C1CC4H+GkP2ynL9mCtFJb86US
 t2VcihgfdFSLN
X-Received: by 2002:a50:d097:0:b0:415:cec5:3b31 with SMTP id
 v23-20020a50d097000000b00415cec53b31mr9091231edd.377.1646391162965; 
 Fri, 04 Mar 2022 02:52:42 -0800 (PST)
X-Received: by 2002:a50:d097:0:b0:415:cec5:3b31 with SMTP id
 v23-20020a50d097000000b00415cec53b31mr9091206edd.377.1646391162721; 
 Fri, 04 Mar 2022 02:52:42 -0800 (PST)
Received: from localhost ([185.140.112.229]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05640251c900b00415d3012600sm1965193edd.50.2022.03.04.02.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:52:42 -0800 (PST)
Date: Fri, 4 Mar 2022 11:52:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
Message-ID: <20220304115240.71d241ad@redhat.com>
In-Reply-To: <ee76dcac-8914-2f24-9920-9d93aa29c22d@redhat.com>
References: <20220228075203.60064-1-gshan@redhat.com>
 <20220228100820.477e2311@redhat.com>
 <41eb791c-a74a-7ed6-df05-cd1867ecbb5f@redhat.com>
 <20220301114257.2bppjnjqj7dgxztc@sirius.home.kraxel.org>
 <ee76dcac-8914-2f24-9920-9d93aa29c22d@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Shan Gavin <shan.gavin@gmail.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qlCNzuN0lDks

On Thu, 3 Mar 2022 11:25:25 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Gerd,
> 
> On 3/1/22 7:42 PM, Gerd Hoffmann wrote:
> >>> Unless it architecturally wrong thing i.e. (node size less than 128Mb)
> >>> ,in which case limiting it in QEMU would be justified, I'd prefer
> >>> firmware being fixed or it reporting more useful for user error message.  
> >>
> >> [include EDK2 developers]
> >>
> >> I don't think 128MB node memory size is architecturally required.
> >> I also thought EDK2 would be better place to provide a precise error
> >> mesage and discussed it through with EDK2 developers. Lets see what
> >> are their thoughts this time.  
> > 
> > Useful error reporting that early in the firmware initialization is a
> > rather hard problem, it's much easier for qemu to catch those problems
> > and print a useful error message.
> > 
> > Fixing the firmware would be possible.  The firmware simply uses the
> > memory of the first numa note in the early initialization phase, which
> > could be changed to look for additional numa nodes.  It's IMHO simply
> > not worth the trouble though.  numa nodes with less memory than 128M
> > simply doesn't happen in practice, except when QE does questionable
> > scaleability testing (scale up the number of numa nodes without also
> > scaling up the total amount of memory, ending up with rather tiny
> > numa nodes and a configuration nobody actually uses in practice).
> >   
> 
> I still don't think QEMU is best place to have this kind of limitation,
> which the first NUMA node should have 128MB memory at least. For example,
> the limitation exists in EDK2-version-A.0 and the limitation is removed
> in EDK2-version-A.1. The QEMU can't boot the guest using EDK2-version-A.1,
> but we should succeed.

if firmware is not an option, I wouldn't opposed to printing warning
message from QEMU if you can detect that you are running broken edk2
and under condition that no new infa/hooks are invented for this.
(assuming it's worth all the effort at all)

Maybe put it in virt-arm specific machine_done.

> If it's not worthwhile to be fixed in EDK2, it might be doable to improve
> the error message printed by EDK2. Otherwise, we would ignore this issue
> because 128MB node memory size isn't used in practice. If the EDK2 error
> message can be improved, we might have something like below:
> 
> ASSERT [MemoryInit] /home/lacos/src/upstream/qemu/roms/edk2/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLibConstructor.c(93): NewSize >= 0x08000000
> 
> to
> 
> The first NUMA node should have more than 128MB memory
> 
> Thanks,
> Gavin
> 

