Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp673302lfg;
        Tue, 17 Aug 2021 09:28:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTpRTMJuBJ/unTuXs+rvRzPS7yPU1vukp0WNYMk6ukGmChaiJ0rMm0fdDdBG6Mfcn9Y8wD
X-Received: by 2002:a1f:308d:: with SMTP id w135mr3368104vkw.15.1629217711360;
        Tue, 17 Aug 2021 09:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629217711; cv=none;
        d=google.com; s=arc-20160816;
        b=aya+ECPuOr6QlUQ0z6twfG+sxwIeZMKKClyVzpRMQJI6IzHZ4ZSFgVuoyPohpEMmPo
         pcvPAbggDV1FltObHyovR15Wwm52CDVgzQc7136CWN+jeAgqWis2vevIOl+YU/Ij54wa
         ArvW7fPI1YoCwrwePktNVFf7VHO1IZRjVrIUSXvMJT5jx58QjhlBJMK1VZ1apWhJNh9B
         LZVghxpPgMoT85mA0YJ+xGmg/eZlEebI1I0ChZOKGSeXMS6z/6WLisX68ACh5/K+sLL9
         DnjbH66qxq5w6ok3DLOq4i89p3H98dgiSi2GyXtKNcGDuY3q7zW2TFBDpmTOtzc6Dyas
         jxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=aX9fYUp8Bnps3b3KLSGFLkJzQmdpPbyDeYWUQoEFU6c=;
        b=NGMGNb1KbW1qzdg8eakQFjp5lnoWWU1mIin1CQOwjpXySoIxZ4Cb2rIuBq64fcTdAI
         zn0oMJPTcr9HCLip4TCzX6UWDul/00z2O968AnnUHeGN95J8MD6pNcPntuQnjwFeJbJH
         U2LNIQIvgpsM8DvWqcNMBzA4JRDKAWUfiheiIaEG77Kols3ryGEs1+NvYK/ECG6k4X9w
         DgbHurTngEoTeNwjcKKmDwnsj+qP0PTZfdDGN7jr4KLyC82AY7t1pNfCu4arlifKojc6
         uJuZbKSzPKsb9O9O1lC8hOz6U79fynbVV+pS/K1oZk/7eNS/TEN65tK3USdKu1fbz69O
         lmWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PPoZoWNe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f25si1619132ual.219.2021.08.17.09.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 09:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PPoZoWNe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG1x0-0006IU-GR
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 12:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mG1wo-0006Hy-Kw
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 12:28:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mG1wn-0007xw-37
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 12:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629217696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aX9fYUp8Bnps3b3KLSGFLkJzQmdpPbyDeYWUQoEFU6c=;
 b=PPoZoWNeUxYbWdaI+XkV29vVHtVOVCc5Fb9hze/AGffn7DCmzl4wnusLikFZTCMp9biii3
 0mEcROPueDlNtudWlOX4Pdzj/l4HX0x1CyQBt39WMuU3rbcC7FlkYOfZswaRcTpVf9R+zm
 jig1s5kI/B0JiAq0kex0EDL3yAF5IcY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-mCoQ1VpVNFWNrea-nFmHWg-1; Tue, 17 Aug 2021 12:28:15 -0400
X-MC-Unique: mCoQ1VpVNFWNrea-nFmHWg-1
Received: by mail-ej1-f71.google.com with SMTP id
 gg1-20020a170906e281b029053d0856c4cdso6232547ejb.15
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 09:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aX9fYUp8Bnps3b3KLSGFLkJzQmdpPbyDeYWUQoEFU6c=;
 b=Rs7OR0JVyFadFdclvwKbTQex+BP6LE+2hMShgaRkJU4EVQMQuAF+OEkhHyJibUtFh6
 DFuc2Rvz/5aS86w7BAUSDMqVZIyOJKmGumsC3rRvLuwp0CNEb9jz4x9NUQqFXKRWfgNs
 2RAh8fo2gfYz1qcplehSzFVsYG40YU3pZagBH64G7Aa+BiaxlvOCMd+ZBuYx0fB5UinM
 ym5WbUXy7UIzEZVGGFZ+EhvaXHoaw3qNP4z8yejSBrXbuuxrNOs+oNLiJ24qSxefnEvp
 +1TMSsvA/bhPWB8zvwzJu/4XtU+/u1SVAhJewLCh4NSgJATt0URQDVyuNenfZNFerswA
 dcGw==
X-Gm-Message-State: AOAM531cJw5GqjDi+JAwaQFXWkz2Q7m5CNky5v0QaHnNh7ZhmGiaJ4qX
 mxebQcX76/xx7vWyIkLTL7FoeItLYHjJ+hPV0U7l73xvzeMoC/APJqbU8AeoQJ9XtvZ9ApTHq9Z
 2mid2sjZAM2XM
X-Received: by 2002:aa7:de98:: with SMTP id j24mr5130717edv.139.1629217694010; 
 Tue, 17 Aug 2021 09:28:14 -0700 (PDT)
X-Received: by 2002:aa7:de98:: with SMTP id j24mr5130699edv.139.1629217693825; 
 Tue, 17 Aug 2021 09:28:13 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id d16sm1300380edu.8.2021.08.17.09.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 09:28:13 -0700 (PDT)
Date: Tue, 17 Aug 2021 18:28:11 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210817162811.u3i5hcx7eg52akyq@gator.home>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
 <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
 <20210817153639.o5fxdgmuhjusvyhq@gator.home>
 <3846b738-719f-a9a1-a59d-d7f54e71009c@linaro.org>
MIME-Version: 1.0
In-Reply-To: <3846b738-719f-a9a1-a59d-d7f54e71009c@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y9NMz+G254JD

On Tue, Aug 17, 2021 at 05:53:34AM -1000, Richard Henderson wrote:
> On 8/17/21 5:36 AM, Andrew Jones wrote:
> > On Tue, Aug 17, 2021 at 05:23:17AM -1000, Richard Henderson wrote:
> > > On 8/17/21 1:56 AM, Andrew Jones wrote:
> > > > I guess it's fine. You could easily create a new cpu_arm_set_sve_vq()
> > > > which would forbid changing the properties if you wanted to, but then
> > > > we need to answer Peter's question in order to see if there's a
> > > > precedent for that type of property.
> > > 
> > > I don't see the point in read-only properties.  If the user wants to set
> > > non-standard values on the command-line, let them.  What is most important
> > > is getting the correct default from '-cpu a64fx'.
> > > 
> > 
> > So maybe we should just go ahead and add all sve* properties, but then
> > make sure the default vq map is correct.
> 
> I think that's the right answer.
> 
> Presently we have a kvm_supported variable that's initialized by
> kvm_arm_sve_get_vls().  I think we want to rename that variable and provide
> a version of that function for tcg. Probably we should have done that
> before, with a trivial function for -cpu max to set all bits.
> 
> Then eliminate most of the other kvm_enabled() checks in
> arm_cpu_sve_finalize.  I think the only one we keep is the last, where we
> verify that the final sve_vq_map matches kvm_enabled exactly, modulo max_vq.
> 
> This should minimize the differences in behaviour between tcg and kvm.

That's a good idea. I'll send a patch with your suggested-by.

Thanks,
drew

