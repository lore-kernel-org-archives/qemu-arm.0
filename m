Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1799463lfb;
        Thu, 29 Apr 2021 08:57:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTn9SHCZbDiyGZLOq/Vz+AypH2dC8yg44Tq8RJFRPJke/+S/N+OYsFSLK0RQrw9Ek56hx0
X-Received: by 2002:a92:cc8c:: with SMTP id x12mr302488ilo.203.1619711843792;
        Thu, 29 Apr 2021 08:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619711843; cv=none;
        d=google.com; s=arc-20160816;
        b=p8tn50O69UE3Ok+gVm80DhHTJMWNldJLjUo0tqs2JcOtPdrNvgcuRRlL1nTEo36fXi
         duBU/zDwI+paviUqsY3/yeoo3CMESNIFeIdNgs12QDAuToabvDqaMsjJ9ir+IThz5TNk
         ESRCbNfXCvdSI1sMWBhun7pw7aARRK8v6VZ7FPnhSuJ5RfERi/ebYP6tpO041zwlZpPN
         o7anCd33787VkFZRR2YuucFKZAJXmOA6x5CVOzbpXo20gJDfiAbpCO9/YXH+T8ZdRREd
         cNZLlJtb0bUv6u1leNk6lG8lhI/UrXoSs9bl2795dzT9I9t80SiMAtqip+kVKVTs/VCN
         Rhtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=gV1rD9bP2auaigdAbuGR4mySJTtzY5Cye9xn+YBFw4I=;
        b=A55iHCtmxfkIR82vWEzSxVNEWt0iBD4dOMG8UM9PILip9MR/qayX4pxqPg8iJxvMKl
         YMlig3W/MsGjR+3gNGSrisNOFp5res+xJTUwhTe/EWnhBQEY9hFzxz/JJ6n+MO60a3g3
         57eMJBqsHtiRVFh04f9HwScKOuDM/SJw+I9Tykt/+t35o1bgDhRkw/0ggkbiN4VPupZg
         Jz76esRkAiEb/wY0FG0a44kqIaDnoHulWD+bkkaNm9mY7sVlSTprljit7GvqYMXCj3+G
         bJFXP43mC1e/j62ifP4O+mMbA+r0JAKXUkPHb6ryniQx+j+AHAfak/eA4jRqg8zN/99v
         1P2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ale+RNCB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11si4249913ilu.158.2021.04.29.08.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Apr 2021 08:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ale+RNCB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lc92Z-0007IO-4e
	for alex.bennee@linaro.org; Thu, 29 Apr 2021 11:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lc90p-00062r-Dx
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 11:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lc90k-0000Sh-FQ
 for qemu-arm@nongnu.org; Thu, 29 Apr 2021 11:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619711729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gV1rD9bP2auaigdAbuGR4mySJTtzY5Cye9xn+YBFw4I=;
 b=ale+RNCBzti8iTEyMH0IiXc8pSPECAbPhzHnwRtN7MmK2OR6Y19Va8KmPgVUugp8Eip+dG
 VS39VFlNfhBHY1xkDtPdkCUJLHEPtCxTYMa0sMt0WzaPhBR2TKwXk3sIOps5e3ioAceQN5
 Q5GEtS+c+4jJPH1DcV4nI6llyPDRyBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-RWF37mhfMXigVq3nHW7iqA-1; Thu, 29 Apr 2021 11:55:27 -0400
X-MC-Unique: RWF37mhfMXigVq3nHW7iqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E6B08026BB;
 Thu, 29 Apr 2021 15:55:25 +0000 (UTC)
Received: from localhost (ovpn-115-28.ams2.redhat.com [10.36.115.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E21A319C59;
 Thu, 29 Apr 2021 15:55:14 +0000 (UTC)
Date: Thu, 29 Apr 2021 16:55:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH v4 0/3] nvdimm: Enable sync-dax property for nvdimm
Message-ID: <YIrW4bwbR1R0CWm/@stefanha-x1.localdomain>
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Rcrw00CWvSVPCG9y"
Content-Disposition: inline
In-Reply-To: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, linux-nvdimm@lists.01.org, aneesh.kumar@linux.ibm.com,
 armbru@redhat.com, marcel.apfelbaum@gmail.com, bharata@linux.vnet.ibm.com,
 haozhong.zhang@intel.com, ehabkost@redhat.com, richard.henderson@linaro.org,
 groug@kaod.org, kvm-ppc@vger.kernel.org, qemu-arm@nongnu.org,
 imammedo@redhat.com, kwangwoo.lee@sk.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, shameerali.kolothum.thodi@huawei.com,
 shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NNVpy2ufcitA


--Rcrw00CWvSVPCG9y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 11:48:21PM -0400, Shivaprasad G Bhat wrote:
> The nvdimm devices are expected to ensure write persistence during power
> failure kind of scenarios.
>=20
> The libpmem has architecture specific instructions like dcbf on POWER
> to flush the cache data to backend nvdimm device during normal writes
> followed by explicit flushes if the backend devices are not synchronous
> DAX capable.
>=20
> Qemu - virtual nvdimm devices are memory mapped. The dcbf in the guest
> and the subsequent flush doesn't traslate to actual flush to the backend
> file on the host in case of file backed v-nvdimms. This is addressed by
> virtio-pmem in case of x86_64 by making explicit flushes translating to
> fsync at qemu.
>=20
> On SPAPR, the issue is addressed by adding a new hcall to
> request for an explicit flush from the guest ndctl driver when the backend
> nvdimm cannot ensure write persistence with dcbf alone. So, the approach
> here is to convey when the hcall flush is required in a device tree
> property. The guest makes the hcall when the property is found, instead
> of relying on dcbf.

Sorry, I'm not very familiar with SPAPR. Why add a hypercall when the
virtio-nvdimm device already exists?

Stefan

--Rcrw00CWvSVPCG9y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCK1uEACgkQnKSrs4Gr
c8g/QAf/Zl3J7k2z3nQpWi/HcgKIqmiZ/gYlHxU610TnzxB0pWJfprNzeuJEWeaC
tT9RloGdmS+KmKkKjX7LQplDEry2hc6tEbyUfj3YemUW5Lz8gouaagtSkfLOFsVb
Gpd74EcslwzSzeTmaczXTLP6MVsNaLBJx94C2/tIouGbAZwHcXSWPk/czqFm3YfL
1Zddp77kaNiEOxk62DmL2+iW5NHzNNNzQZyMOod6el05nvuCQrobqzu3HuJ9LklE
CWyi3GbrFLVIsB/xFKIGykaCOaQLpdc/KP6ckdN4mWTStJv9DUCd4ypomrhd1utY
NaKyqhVKEC95PHCEz1YZk9BP8SwUlg==
=jrRj
-----END PGP SIGNATURE-----

--Rcrw00CWvSVPCG9y--

