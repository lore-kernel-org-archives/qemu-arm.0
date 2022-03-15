Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2886470lfo;
        Tue, 15 Mar 2022 06:49:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwbBJGGN6suMRSKuay+og88lZMX6CTBot2iGsee8fL7n4Gq2fCBfq4TNP0OxmrtATux4c1
X-Received: by 2002:a17:907:94c6:b0:6da:9561:ce0 with SMTP id dn6-20020a17090794c600b006da95610ce0mr21912675ejc.342.1647352182327;
        Tue, 15 Mar 2022 06:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647352182; cv=none;
        d=google.com; s=arc-20160816;
        b=Vf4s9PP1qKlieSA9fbf/QpYOy22y2j7yUz5m/znko1yj5N9zZCpjL3QCwSEanUVuq9
         Cyv0R3Y4MBmvovCG+3WHDsZGyHTXIsvHQNvQixyI4t/FFFbpshx3Ye7sQPnnErsD+rw3
         2yIOHWahtCtyIn/wJgux6TbL8ooNzqy+Sp33zlj5/FUEp9LkbnIGil82/BkG9yX8KyXF
         pkcwq5EBv1nZANl+9KUBGruYJFwPtsagiyZW0UZe+RdeVy0Fo7sxNMvVMZeufYbbRX7N
         bWnzQWIGc0dlvpQ/RtcROS+DlvfFW+JbyJ/YjWoOCr1WMQyrgz/BgS3iYanswacudIHR
         Ss2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=5HlQ4H+cbLWxhYmsVyucCORxv3SL1m40NFO11ExzIrY=;
        b=Qu19dFp2OTu+DqHk+wpAso7rn/Y2hUbE9U3O3xfPJ7PesD8tfaZxee+nFOutYmizeV
         ENXmMhpOvxP1+hRwp3AXW+y+gll9z1g0G8jML+Yey2lduoqGkfOHtmFOOi2O+weanl9H
         n0YUEMnoKjEY1XpHhbl5AnXsSnHrTGt/j1DNFVET6ld/wpldsTHHTbkrEER2UmFqK0x8
         /nj5J6md8lB9xS6CbLTah75g2jjb50ElEpA+d3ZBmZxE7osRsML40pT+wWaiffJk6RPU
         CcWvLVMGDXkrg6PYbXNgqgQgLEkD0fepkOBMHohyUrLQIdTFas64ny2KjBNZ258NOqFU
         grpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GVufNkua;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q7-20020a17090676c700b006adefdfba73si11102575ejn.729.2022.03.15.06.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Mar 2022 06:49:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GVufNkua;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647352181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HlQ4H+cbLWxhYmsVyucCORxv3SL1m40NFO11ExzIrY=;
	b=GVufNkuacXagA8pTrioB7mXvyo1bkE8zJShX2HqpG9YrvxaXSibhwqBTizjTQbrreectpL
	PcHp1DEVrSKs2hopZC8JwujY8Qi2Y0WfSydcdn/7UAwx5En1UK1jsPr0Zvvvqvm2OKGXMm
	jwWrzQxcE6fMwQy+GfwntEsO+qiC4aY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-LiPRJB8QPOiCtDGK4ztl3A-1; Tue, 15 Mar 2022 09:49:38 -0400
X-MC-Unique: LiPRJB8QPOiCtDGK4ztl3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3195780281B;
	Tue, 15 Mar 2022 13:49:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56CE3C44AE5;
	Tue, 15 Mar 2022 13:49:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2DEBE21E66CE; Tue, 15 Mar 2022 14:49:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Christian Schoenebeck <qemu_oss@crudebyte.com>,
  "Gonglei (Arei)" <arei.gonglei@huawei.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Igor Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,
  Laurent Vivier <lvivier@redhat.com>,  Amit Shah <amit@kernel.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Anthony Perard <anthony.perard@citrix.com>,
  Paul Durrant <paul@xen.org>,  =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>,
  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Corey Minyard
 <cminyard@mvista.com>,  Patrick Venture <venture@google.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Peter Xu <peterx@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  Daniel Henrique
 Barboza <danielhb413@gmail.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Jean-Christophe Dubois
 <jcd@tribudubois.net>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Yuval Shaia <yuval.shaia.ml@gmail.com>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Magnus Damm <magnus.damm@gmail.com>,
  Fabien Chouteau <chouteau@adacore.com>,  KONRAD Frederic
 <frederic.konrad@adacore.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Artyom Tarasenko <atar4qemu@gmail.com>,
  Alex Williamson <alex.williamson@redhat.com>,  Eric Auger
 <eric.auger@redhat.com>,  Max Filippov <jcmvbkbc@gmail.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  David Hildenbrand
 <david@redhat.com>,  Wenchao Wang <wenchao.wang@intel.com>,  Kamil
 Rytarowski <kamil@netbsd.org>,  Reinoud Zandijk <reinoud@netbsd.org>,
  Sunil Muthuswamy <sunilmut@microsoft.com>,  Cornelia Huck
 <cohuck@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>,  John Snow <jsnow@redhat.com>,
  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  xen-devel@lists.xenproject.org,  qemu-ppc@nongnu.org,
  qemu-block@nongnu.org,  haxm-team@intel.com,  qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
References: <20220314160108.1440470-1-armbru@redhat.com>
	<20220314160108.1440470-4-armbru@redhat.com>
	<877d8w5m9e.fsf@linaro.org>
Date: Tue, 15 Mar 2022 14:49:34 +0100
In-Reply-To: <877d8w5m9e.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Mon, 14
	Mar 2022 19:48:47 +0000")
Message-ID: <87ilsfl40h.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: knmbs70rslR8

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>> for two reasons.  One, it catches multiplication overflowing size_t.
>> Two, it returns T * rather than void *, which lets the compiler catch
>> more type errors.
>>
>> This commit only touches allocations with size arguments of the form
>> sizeof(T).
>>
>> Patch created mechanically with:
>>
>>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci=
 \
>> =09     --macro-file scripts/cocci-macro-file.h FILES...
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>

[...]

>> --- a/hw/pci/pcie_sriov.c
>> +++ b/hw/pci/pcie_sriov.c
>> @@ -177,7 +177,7 @@ static void register_vfs(PCIDevice *dev)
>>      assert(sriov_cap > 0);
>>      num_vfs =3D pci_get_word(dev->config + sriov_cap + PCI_SRIOV_NUM_VF=
);
>> =20
>> -    dev->exp.sriov_pf.vf =3D g_malloc(sizeof(PCIDevice *) * num_vfs);
>> +    dev->exp.sriov_pf.vf =3D g_new(PCIDevice *, num_vfs);
>>      assert(dev->exp.sriov_pf.vf);
>
> So what I find confusing about the conversion of sizeof(foo *) is that
> while the internal sizeof in g_new is unaffected I think the casting
> ends up as
>
>  foo **

Yes.  g_malloc(...) returns void *.  g_new(T, ...) returns T *.

> but I guess the compiler would have complained so maybe I don't
> understand the magic enough.

It doesn't complain here because dev->exp.sriov_pf.vf is of type
PCIDevice **:

    struct PCIESriovPF {
        uint16_t num_vfs;   /* Number of virtual functions created */
        uint8_t vf_bar_type[PCI_NUM_REGIONS];   /* Store type for each VF b=
ar */
        const char *vfname; /* Reference to the device type used for the VF=
s */
        PCIDevice **vf;     /* Pointer to an array of num_vfs VF devices */
    };

It does complain when the types don't match, as shown in PATCH 2.

> <snip>
>> index 42130667a7..598e6adc5e 100644
>> --- a/hw/rdma/vmw/pvrdma_dev_ring.c
>> +++ b/hw/rdma/vmw/pvrdma_dev_ring.c
>> @@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *nam=
e, PCIDevice *dev,
>>      qatomic_set(&ring->ring_state->cons_head, 0);
>>      */
>>      ring->npages =3D npages;
>> -    ring->pages =3D g_malloc0(npages * sizeof(void *));
>> +    ring->pages =3D g_new0(void *, npages);
>
> At least here ring->pages agrees about void ** being the result.
>
> <snip>
>
> So other than my queries about the sizeof(foo *) which I'd like someone
> to assuage me of my concerns it looks like the script has done a
> thorough mechanical job as all good scripts should ;-)
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks!
