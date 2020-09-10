Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1517775lfq;
        Thu, 10 Sep 2020 10:44:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJpgVqrU6dFDYTaz32+7RixXWkjlCBSWWBwvI+JO1nxvKBKYGFnhotCjfXRH6MC4dv3KHb
X-Received: by 2002:a25:730c:: with SMTP id o12mr15167635ybc.512.1599759847840;
        Thu, 10 Sep 2020 10:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599759847; cv=none;
        d=google.com; s=arc-20160816;
        b=HehHPTrZ6JqapmTmRUX/hESJvhoxmCM2V11zUXbzZkqOQ93Xu/2fIP4mhifqkE6Clv
         7Wsos0mMB7Zh+QyDfPwceULAMz+v3dteJGL91MP7C/gy1UptW4cOwcKHNVL3nTkMT3T5
         eJeANDD1/s51ZNfZSl5GbMRar/ZfS2z5ttymD03PIXSHUTPK+hqlcpKx/mLWKL1fdela
         79wdwbQ0O/jn7l+sc2iqq+QTOflTfQgHnc6RAo9gKkZAMefXfzmZhDp0wea3oATivm05
         vVuORqlrINqpHFyH67E2tXRDEdUHwuTSbnXr4doD9h0hO7hK1ikHT7gNDpNR4oDlCPYV
         pfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=HxoTeiZNK+pH/yKGetocZELouNmPqnIEEy692krS+bc=;
        b=gDcEOdZvkn0Ic/KgDXHIlhh65UVXL3deD/JSHaPjD/aOqTvPW2MSnafFeU1HFlgITC
         EWhTMQgdK+Od34PhwXgT7vsmjy0m8NRJ+ZcFO8z6G63QQCfBdVe5pHI3ZxOHUeIXK2qa
         n5JAjuYPQFjx4sXLDJpVuihzzBlvf0F5Gx8duXKgQFxndYaykf7HK1VKy+bU4r0I/syU
         i2QOvibVzfTuXwvodR/DW5d9lsiMnZHIfTTR7rFAro3KOwxGdzix9QAQL/tkgiptzqcf
         cXBnyLxxwQHID/nhtmzd6BQTr75tvy63ZbWBj6PjKci6gC70hS/mlBTQBI5c0Ijs5nno
         mpAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I3Xsqxpw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si6278723ybk.24.2020.09.10.10.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 10:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I3Xsqxpw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGQcB-00033z-8Z
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 13:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kGQc1-00031y-OT
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kGQc0-00040K-9T
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599759835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HxoTeiZNK+pH/yKGetocZELouNmPqnIEEy692krS+bc=;
 b=I3XsqxpwVPxy+YQlNiH/kPE+TlnPdl0johCzZDQmx5Er8mg7tQOEyb1AhPN4637msOZZRM
 CtJXnPVOZ8EHtfNA3QZIZ6pQ4LdRUFf3j9+wGVEwo+IR9vg5eIGaMfZywyP72EgLW9kQsp
 RoYg8QpjSyZLvcWLZPp0M0syDDsRjKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-zcEABAt2Oe-DBOzmN-ZVoA-1; Thu, 10 Sep 2020 13:43:51 -0400
X-MC-Unique: zcEABAt2Oe-DBOzmN-ZVoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FEE18030C4;
 Thu, 10 Sep 2020 17:43:50 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 529CD5D9E8;
 Thu, 10 Sep 2020 17:43:49 +0000 (UTC)
Date: Thu, 10 Sep 2020 19:43:46 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Master cannot execute MTE instructions
Message-ID: <20200910174346.6y24jkyd7ca4xuoz@kamzik.brq.redhat.com>
References: <CAJoBWHwtE+HWkoj3a2pdYHOkPpG7ya=+-RRFvUp-SXwuTWvm5g@mail.gmail.com>
 <CAFEAcA8spQVin2vj2V5DJYQCR_BizqrRneoRMKhqKAzFv8EiMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8spQVin2vj2V5DJYQCR_BizqrRneoRMKhqKAzFv8EiMg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:38:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Derrick McKee <derrick.mckee@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zgscT1+iK1Ig

On Thu, Sep 10, 2020 at 05:17:17PM +0100, Peter Maydell wrote:
> On Thu, 10 Sep 2020 at 16:06, Derrick McKee <derrick.mckee@gmail.com> wrote:
> >
> > Hi,
> >
> > As of commit 9435a8b3dd35f1f926f1b9127e8a906217a5518a compiled with the default configuration, softmmu-aarch64 issues an illegal instruction fault when executing a memory tag instruction.  Below is a minimal code example that triggers the bug.
> 
> What QEMU command line are you using to run this?
> In particular, MTE is not enabled by default, so you need
> "-cpu max,mte=on" or similar, is not enabled for any
> board except 'virt', and doesn't work with KVM, only TCG.

Actually I think the 'max' cpu type has it enabled by default, but you
need '-machine virt,mte=on' for it to work.

Thanks,
drew

