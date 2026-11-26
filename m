Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64020606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 17:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S6p0MV28
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWd2T-0007vw-5f; Thu, 26 Nov 2026 12:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1xWd2O-0007vG-6z
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 12:13:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1xWd2M-0005wv-EC
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 12:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795713212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07kpCWT8Avv4yyzlDHWjKwxBansiZJpIXtC8+j4BF9Y=;
 b=S6p0MV28imiCrjQO+128lxjixaad1j41FbMTidXsSpKDMMkhhcHDI/6nJHBMsqjZfi6mu2
 SNjixEda7pldlVrJBHaSROntwTw539PBWHx2HrMb5rwFaUqujU3PTAi+9x6BoDJnYjoJc/
 221WYE1M9ZClF5rtuOt0W/rBvpN6X+k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-DtHPfeULMIW2pgSzY9C6dg-1; Thu, 26 Nov 2026 17:13:30 +0000
X-MC-Unique: DtHPfeULMIW2pgSzY9C6dg-1
X-Mimecast-MFC-AGG-ID: DtHPfeULMIW2pgSzY9C6dg_1795713209
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-48e00f3929bso4230906f8f.0
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 09:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795713209; x=1796318009;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Mb8Bhbqxu6oM0N1y8b2BBJmbdRvDKKI8uFyOuRtNW2w=;
 b=kCYgcf1G60xBtz0DkK1fC/ouOZq5qcbX+bDml3wn+YsoamafzWYUSIP5j4IRn9pz4S
 DbwkG8inYkusGaI1AXTSS6oYSvZMshrgpymjbMbQo9nlkp5mhipf6UDrMwlCGj2lTkfW
 Rnr/woCi3eZJ41gZCHyMKLd4pgLgicFRDxJTCTrLBu34kk/o4fpKQDbMoEMLbPvnE7LQ
 4uOLG9SfbX9c4fyTyplkis6G3UG61tSmOPhdOc2fP6lD6HbGaGY+CLYd+JavFCQvNHch
 yuVACMuv9icPmzfV4Pm2aq9U+1BKzf9IQIqvqNmubigok2MSppebSUV+VSjSHA54AIQs
 8opg==
X-Forwarded-Encrypted: i=1;
 AL+hErFenFPD0Nm7+kpJ1Lvwq3Wc0DTpDDMlzQYwCqiCHd2kFdu2mDtWKlEQa25DGrJsY+A5ZYNfFeP67g==@nongnu.org
X-Gm-Message-State: APuU4Z8fb6dqmdsDeT9zXLkaCI8QBQ6sY0jPNwxcII3CvGzjYs3N1QJd
 4EQ4+GqFqPhspgRuBfCT/t6grsKeq0LODfDIz/cC37W8w4yVJvwuXwvWrP7tN2r0haRHhnWreXE
 lRcCyqVTnpNiDD7WsyI5XOaMvDfDRpkkfJgDSN8bBhXM2Hg7CCPtJzw==
X-Gm-Gg: AZFdTZfg7hThv1fTdINAmxvFDO1Gt/Ksb7EWEmMKdjEfUrjO96gXLgh9nXgPqnyCz4Q
 gNTPQUNAj5dHXEyKjpSMC3vwD/duOLcwD1vLF6F4dq4/9L+v6Jqt+yOPnqkSdFUUZOJEVo4EjpR
 0U/hSMelzjEamtjgrfNENRg038PR4+S54h5p8E5HsXp/3D+HWEQaik7PshVT06Nyh55BG2YKjB5
 JcCXtl2Jw5XvrkCAmf4f/5DPHj4SPQtNwf7cljHtw1HrV8QUfiHfVQK4o1UGLnu5rVyUldM8rSs
 Qopu4LNYvbuib8/rc+dazLHAmXntMXE2vAWH7J0Ov6PX9RGxo2KoUytP8O+8/sTg3OQIPJWqskD
 T4sOPxJBKgIV5G6rW6kAncQcMcHLo0gCDsujltlKwyozi3s6QdkgGVoqWqVlGAOjy2bHTNlmO71
 RfRykzHC62o4qB2+l4
X-Received: by 2002:a05:600c:80c1:b0:4a2:10d:5e0d with SMTP id
 5b1f17b1804b1-4bb8615a739mr336371085e9.14.1795713209210; 
 Thu, 26 Nov 2026 09:13:29 -0800 (PST)
X-Received: by 2002:a05:600c:80c1:b0:4a2:10d:5e0d with SMTP id
 5b1f17b1804b1-4bb8615a739mr336370715e9.14.1795713208866; 
 Thu, 26 Nov 2026 09:13:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:af16:8320:54ea:4bc9?
 ([2a01:e0a:f0e:9070:af16:8320:54ea:4bc9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67fe48sm38213038f8f.23.2026.11.26.09.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 09:13:28 -0800 (PST)
Message-ID: <fa7522a1-1d0e-4bdf-aad9-767c08878cd1@redhat.com>
Date: Thu, 26 Nov 2026 18:13:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/3] arm/kvm: select an nVHE-only EL2 with
 SYSREG_ID_AA64MMFR1_EL1_VH
To: Haseeb Ashraf <haseebashraf091@gmail.com>,
 Khushit Shah <khushit.shah@nutanix.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Haseeb Ashraf <haseeb.ashraf@siemens.com>, Eric Auger
 <eric.auger@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <8A57A0C8-9E85-4BAC-803A-DAFC6DBD6612@nutanix.com>
 <20261126062002.136401-1-haseebashraf091@gmail.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20261126062002.136401-1-haseebashraf091@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YAO-mxJe8wppS6166NbDXGJKfnub_niFGzy4FWD_UzU_1795713209
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Haseeb, Khushit,

On 11/26/26 7:20 AM, Haseeb Ashraf wrote:
> Hi Khushit,
>=20
> On 26/11/26 11:38, Khushit Shah wrote:
>=20
>> There are many such fields like PAuth (APA, GPA, =E2=80=A6) and SVE. The=
y are
>> not part of the SYSREG_ framework as there already exists boolean
>> properties for them.
>> (Another way to do this is having -cpu =E2=80=A6,vhe=3Don/off property)
>=20
> The v1 series was closer to what you are suggesting: it added a
> standalone `vhe=3Don/off` property and used it to select the
> requested KVM vCPU initialization mode.
>=20
> Could you please also review the v1 implementation?
>=20
> https://lore.kernel.org/qemu-devel/20261121095636.289814-1-haseebashraf09=
1@gmail.com/

It is a valid point to question the addition of new vcpu properties (especi=
ally low level ones like this one) while we plan to introduce those SYSREG =
low level properties. For composite properties which stand at higher level =
(tweaking several knobs at KVM VCPU init or IDREG field level) it still mak=
es sense though.

Until now we have proposed for the host vcpu to expose SYSREG props only fo=
r KVM writable ID reg fields. On the other hand, named vcpu models require =
to have ALL ID reg fields exposed. If we were to extend this infra to other=
 archs or TCG, we may also need to expose ALL fields and just have differen=
t implementation for setters/getters depending on the writability mode (REG=
 WRITE or VCPU init or anything else).=20

Thanks

Eric>=20
> I changed direction for v2 following Marc's feedback against adding a
> separate property.
>=20
> Thanks,
> Haseeb


