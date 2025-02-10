Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2205162njb;
        Mon, 10 Feb 2025 12:40:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxuQWuxF4GJ7kCX4ZRC+81gA3obv8c7jFRfOh3KVcOuoiL2l8mz9hKPrASeXuLCMJ8mPwjRMf7re3q0g==@linaro.org
X-Google-Smtp-Source: AGHT+IGdCDI4Ozr5A9h1WCQ6FM/vuovR5YoS0OwA8VYk2yiCPdVVSqxbjyUf/4wlUcKKyo8nUg3a
X-Received: by 2002:a05:622a:1a06:b0:466:89f8:305e with SMTP id d75a77b69052e-47167ae37d6mr228797141cf.38.1739220003382;
        Mon, 10 Feb 2025 12:40:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739220003; cv=none;
        d=google.com; s=arc-20240605;
        b=RHv1o3gYPGMf6q3KZlOluedZwfytNt/MalYKDITMT8rkFOyHI5jaO2tChG7/XWfcR1
         E4DWNagN0ubFJ9mcStCDl6mR8rV/U3Q+5LP+cVZaGv1OVqqBUOJEONUVaGirrx7NX62Y
         zGOHeTS08JwQK/jhvoDN9c6o18CuIjlPnYJuXLvjlUsSTj+hwj+ljMSRA/3kYXGzEWty
         QyI4IUn1nVFF7OQjTB6zs3At+zPFelVoZ9lNSq0fFlSpfxaFSIfovLRRw7BXqM1Aupys
         IS4mCXPnE3HnCWQltGA32fuAkn/w5kyXQ8V0mNKwpJrKQAb5MteEaz3ufxDIZimvB1bl
         BDFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=0sascirrTTL3Ba1QHLoaQ9g4Z4jZkMlO9virPyDuR3w=;
        fh=rfg8kt8nxnryXNcCaJGF7E390ATP09NsONpz7REzI+0=;
        b=cfh6JTgFXpgc4CrG+fFYg566o6h5/KZ9G9wAUNQOBnFlzCT3yhei4EwJghPqj60Zjj
         b//wayHFe0AkeBrKHvZB53UWOUG8bJaDzxFZ9ZJjZpqpDmPFoL1X48U60ks82TjWzwhe
         Cgo9K19Ar+crm36aSHhm3V6oDj5zZh8xQW0HcxDsfMANBGXJyZU7JKL8aiQVyCdl+B+w
         O7R6bmLBYfZLhcWlxsfe/bM/vSa1HqvwixscJ3gM9LTDlKV1nOiQ9BB3IPRpkZPy7dT+
         CayqASKWGHQEp+3+OaYyoA1zb+rFiCOsLTZ9d1FUlsMv/fp+1z1tJJea62Hl1NY3tFtU
         lC8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@apple.com header.s=20180706 header.b=jnmbJabH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=REJECT dis=NONE) header.from=apple.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47194907e8asi26200331cf.462.2025.02.10.12.40.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 12:40:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@apple.com header.s=20180706 header.b=jnmbJabH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=REJECT dis=NONE) header.from=apple.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thaZU-00054a-Ea; Mon, 10 Feb 2025 15:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danny_canter@apple.com>)
 id 1thaZT-000548-3e
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 15:39:59 -0500
Received: from rn-mx02.apple.com ([17.132.108.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danny_canter@apple.com>)
 id 1thaZR-00036k-Ei
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 15:39:58 -0500
Received: from rn-mailsvcp-mta-lapp02.rno.apple.com
 (rn-mailsvcp-mta-lapp02.rno.apple.com [10.225.203.150])
 by mr55p01nt-mxp02.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) with ESMTPS id <0SRH291G9IQJCO20@mr55p01nt-mxp02.apple.com> for
 qemu-arm@nongnu.org; Mon, 10 Feb 2025 20:39:55 +0000 (GMT)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_11,2025-02-10_01,2024-11-22_01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=20180706;
 bh=0sascirrTTL3Ba1QHLoaQ9g4Z4jZkMlO9virPyDuR3w=;
 b=jnmbJabHuJ9Y4ZKjkwXPvUvnsBv+JoQfewBSBLW9d7nXuOy3wgEYFar35MKhAZoyXVPz
 CwGw0sIe3GWTjTrFuunI91c9+ayOogFmQeaVKWAy+WNYs3olcVf6iUd7HWzU2pyPP4Zp
 EihCPGLHFh3Z09VTYchfuZZnM8kjRY8B6H36Cap9UnABh83X/PBSh4hNSlRfgm7VypvJ
 8OKCAAuyNBuABdR+Ub7aif+lC8cjpjnldEYHlNx41hRPb1/EwdL+cpNwMkmiIMBUPtZH
 r0r+FsoPzLSms1DUHFg+rfFQWsiCL5idOVJJaO/YnAd/xGJFFhrifYhATcFlUWou0ao8 LA==
Received: from mr55p01nt-mmpp02.apple.com
 (mr55p01nt-mmpp02.apple.com [10.170.185.213])
 by rn-mailsvcp-mta-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) with ESMTPS id <0SRH00N1CIQJI6L0@rn-mailsvcp-mta-lapp02.rno.apple.com>; 
 Mon, 10 Feb 2025 12:39:55 -0800 (PST)
Received: from process_milters-daemon.mr55p01nt-mmpp02.apple.com by
 mr55p01nt-mmpp02.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) id <0SRH0X400INC0100@mr55p01nt-mmpp02.apple.com>; Mon,
 10 Feb 2025 20:39:55 +0000 (GMT)
X-Va-A: 
X-Va-T-CD: 9be860c946f6cbc0801dd392535b1c06
X-Va-E-CD: 2325b25e1853304713f33c2dc3bf5831
X-Va-R-CD: f2c730f0a964009da4023b008f6c4c11
X-Va-ID: ff56baa5-7b1a-49e7-b333-fd79c3c0d7b6
X-Va-CD: 0
X-V-A: 
X-V-T-CD: 9be860c946f6cbc0801dd392535b1c06
X-V-E-CD: 2325b25e1853304713f33c2dc3bf5831
X-V-R-CD: f2c730f0a964009da4023b008f6c4c11
X-V-ID: 9ff289cb-53d6-4fec-9088-17f1f35cfe69
X-V-CD: 0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_11,2025-02-10_01,2024-11-22_01
Received: from smtpclient.apple (unknown [17.243.208.254])
 by mr55p01nt-mmpp02.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) with ESMTPSA id <0SRH0W6CVIQH2C00@mr55p01nt-mmpp02.apple.com>; Mon,
 10 Feb 2025 20:39:54 +0000 (GMT)
Content-type: text/plain; charset=utf-8
MIME-version: 1.0 (Mac OS X Mail 16.0 \(3815.100.3\))
Subject: Re: [PATCH v2 3/3] hvf: arm: Implement and use
 hvf_get_physical_address_range
From: Danny Canter <danny_canter@apple.com>
In-reply-to: <CAFEAcA-Npf_9gV=LP2pmpgQ+dbqxQnJk1ubrtAhUc3nVbM-s6Q@mail.gmail.com>
Date: Mon, 10 Feb 2025 12:39:43 -0800
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Itaru Kitayama <itaru.kitayama@fujitsu.com>, dirty@apple.com,
 rbolshakov@ddn.com, agraf@csgraf.de, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, mst@redhat.com,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, zhao1.liu@intel.com
Content-transfer-encoding: quoted-printable
Message-id: <CF400E00-3635-4556-B19C-91A50A41CD53@apple.com>
References: <20240828111552.93482-1-danny_canter@apple.com>
 <20240828111552.93482-4-danny_canter@apple.com>
 <e67f8106-f741-4e81-a291-db06bfbedd7c@linaro.org>
 <1CE8C01E-6930-4DFA-8C96-CACCFEBD24AE@apple.com>
 <CAFEAcA-Npf_9gV=LP2pmpgQ+dbqxQnJk1ubrtAhUc3nVbM-s6Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3815.100.3)
Received-SPF: pass client-ip=17.132.108.1; envelope-from=danny_canter@apple.com;
 helo=rn-mx02.apple.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eHWk0q0oCjhS

No worries, will get a machine on 15.2 at least as it seems both reports =
are on that or higher. I=E2=80=99ll likely have time mid to late week to =
debug this. Thanks!

-Danny =20

> On Feb 10, 2025, at 10:24=E2=80=AFAM, Peter Maydell =
<peter.maydell@linaro.org> wrote:
>=20
> On Mon, 10 Feb 2025 at 18:20, Danny Canter <danny_canter@apple.com> =
wrote:
>>=20
>> Will do. I=E2=80=99ll reach out if I need extra info. The issue =
appears to be closed though, was this fixed/no-repro already though?
>=20
> Whoops, no, that must have been a mis-click on my part.
>=20
> While you're looking at address-space related bugs,
> https://gitlab.com/qemu-project/qemu/-/issues/2713
> is another recent one -- user reports that QEMU says they're
> limited to 32 bits even though their mac/macos has a 40-bit
> IVA space.
>=20
> thanks
> -- PMM

