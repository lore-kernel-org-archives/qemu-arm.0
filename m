Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp289177lfa;
        Fri, 23 Oct 2020 00:11:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPAESuXzw/ESrMrVcDCEg+ESkZNp5K40gaqGYYLAUdDvm/4Y2BZ8CZLWFb4N0gxU66s/QR
X-Received: by 2002:a5b:b47:: with SMTP id b7mr1620277ybr.344.1603437113173;
        Fri, 23 Oct 2020 00:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603437113; cv=none;
        d=google.com; s=arc-20160816;
        b=WOr7zNdfIZRJFb2Cjmpr8QXJnxPDmi+WTnO77m5TY6bOAcfEnhHinpSJqeXC+/mFkB
         Ff9pyX9KYOdlUpDcpQq6nGVscv1fJyO6Br+fFRENcCV7r5N718nvLB5D+RD/X9cETBzU
         jC4U0UjZtoyisNlG8N6HnHKYXqJLWr8yI7JO2KrAQE2+zeP2/mbw5ii9CRxC18ZTHV6z
         U4vfVrZ3ro4zQcGdztOUbQsP7envKKDuzPDA8lN82mQibJVfmOsA0y/cQBSnQHs5ocSZ
         vMN+0T7oA5FhW8r7lK+zcF247SgXcy6czLOpx+qSK8GuoGOgjxgWw/G74UkQMZVF+/rV
         LpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V8JD9SxiJh8cGYiOJ2X6X3Iae1uEcTZNZ8jZq4GXq/g=;
        b=yiTkoNGRJWeA01+TjBe9xQdCUVL+UDpWPFds0pT4JAECPlO9NCXBq5KzOgJ60W/ItT
         W5yqDC7ZU5ucrDAaXg0LgVgLhIx21RI3RikSfK8CcQ9QW7tQ3A4VYknttVZ0WxK9jmmU
         OvyhvHSgtj1DQjsBRSUEiLXdnbno1wgXMddYR2rj6BPC6lV4Lja3TQKjNigRFMAV2COn
         95YKY2JpMCbzJcx553eR6dR4oi4varjDc0/3/cqR8A/jvO3CGKK1SOgAlXxidwdf3b1a
         SO2GCavSlmN6HkQiz3sgfKHr9+CREqSvMhkCu5G6u97m4mhVzFowLv/EyT8I6W+Pnm5o
         85qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="J/gPtaVJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1si682456ybr.383.2020.10.23.00.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 00:11:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="J/gPtaVJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVrDt-0000yD-Ao
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 03:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDj-0000wK-6h
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 03:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDg-0003d2-CN
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 03:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603437035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8JD9SxiJh8cGYiOJ2X6X3Iae1uEcTZNZ8jZq4GXq/g=;
 b=J/gPtaVJXWBfqz7rtqAL6GyxPmecvr/wM3sg08jYQFM/pqBHRgMf5Iw7sFQYyq0zdcyJ+c
 f5rs2kl5962uWWa1WIsPWphUZzhpw40R0d5USeKhf0VCEUmB0Ti0w2+jTuCDHy484g9cRR
 mjn6DVC7dI/WOaGxvILpk0zI8OOj02c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-vH_ziDEbPwO2nDtZW-hnzw-1; Fri, 23 Oct 2020 03:10:34 -0400
X-MC-Unique: vH_ziDEbPwO2nDtZW-hnzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC107186DD44;
 Fri, 23 Oct 2020 07:10:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F2775D9D5;
 Fri, 23 Oct 2020 07:10:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5C0D4204AC; Fri, 23 Oct 2020 09:10:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] tests/acpi: update expected data files
Date: Fri, 23 Oct 2020 09:10:21 +0200
Message-Id: <20201023071022.24916-8-kraxel@redhat.com>
In-Reply-To: <20201023071022.24916-1-kraxel@redhat.com>
References: <20201023071022.24916-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kkt5Qw5akuHF

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/data/acpi/microvm/DSDT.usb | Bin 414 -> 426 bytes
 tests/data/acpi/virt/DSDT.usb    | Bin 0 -> 5257 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/microvm/DSDT.usb b/tests/data/acpi/microvm/DSDT.usb
index 14423381ea235ed42f6f0f7d98e793c271a4e7c1..bceef778d2633793d5192846e02fb4719de503a0 100644
GIT binary patch
delta 57
zcmbQoyo#C2CD<io6(a)!)6<Du(o8Pm8`aGjrL7}8oIN?>Jv?1_953(+aKwjtx-f9W
NJ3BivPR?aC1OT2T4c`C&

delta 45
zcmZ3*Jdc^nCD<io9wP$-Q_(~&X(kV`jq2u%{Q40d&Ym3c9-b~dju&_ZCRZ{V0s!~<
B3f}+#

diff --git a/tests/data/acpi/virt/DSDT.usb b/tests/data/acpi/virt/DSDT.usb
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a5a46e044bb788da9028a572f55bc28036ce38bf 100644
GIT binary patch
literal 5257
zcmZvg%WoT16o>EFlh__VGIpHz!zq*s3RHeHP5LDE*oj@@#CX!CQYyI;0#UN5M1@o;
zq!6J(yQ7g<2PqQ&1`;b4NZob8nhpN|JIuLrXOiDh&qx{1nYrhi`;Cv|<J<I`JI{+s
z#r|w;du@NIaj)k!>71pM(#QJM{eIoLKkyray~A0rTrMXE?M^dW_j(-)R#b9ur_)q>
zhu6IAZgj2RZI{cHN_Z_f@cMp!)|q;iQW}_2u2RoOm1Uiy=n3VnuJ3y5hWkmYdxyAH
z%Jp~ZPMVUvx@8b~Cub0`)O46xx9|3&DQ#}`w<&e`?6#+wXE%3LEWCLc5fyWHj?lM#
z0})eah)RfP=vh=HgcFk(HZZElsELfY#25ue4H=h3hAlCYz_^TzWsxx=F&tnlBjbw5
z7?l_qU|d1QipWSvj2tjlkg+N<k`luO#ws$dij0)RC;;OsFe>4PgO`}&NQ@#dt|3D#
zQ~n`|N_`R-*O4LDX-1mIG%#);L$1@T#Fz!fO=QS*nv)pwz_^7BxlYF<#v(92LWW$Y
zuEbaZ#u_r@I?YRrw}4SchFqrwiE$nn4P?l5IxaCT0K)@DRj$*b#CR7NO=QS*Iw3JG
z0;7ctxlSh~#s|PyM}}OdQxfA6FgB1O*XgvxC<CL747pBcBt{h&9c0LLIx8_Q1LHO_
z<T{;`7*~MtF*4*jotGG^z}Q5FT&D{X;~Fr!z^KV}x+pPj0AmXoa-EhW#w}oMhm5UX
zdtN7;M{lcFu9sJ-`S7ScGEq%;F|7^SHyT@~ZHd3r&zGF}p7K;jeWsRFnf{t|^tF1Z
zKBZTsAwlEO>+g(je&rk#(sp_{R2zP$tjw`R#}!q`=<`mDf@&1RDX6JJ*3JxvmeM&i
zE{t>*4a}KqK^_f_LY+zcU@Ub>W^5Sg%xEaJK>Cg}G{~e-XGV942bs|f;!0;mL*pis
zh6b4w>P(tZa2GqsjAmd5nbA;cnL^7TlS1?yVV)yFX5=|yGNZ{;h@PX&lbTYRPc)QT
zEcB!hJrm3`!8{Y(lS1@NGS4LQq?QalDMZf{^Q3m#JiXwNq_`)A=;<&|hj~&9hn^Io
zXPSAYnP-}NQiz@z=9yuh)bgPxh3J`Oo>}IZ<(?FxXO4O1m?yP}=t&`Zjxo<M<~hba
zDMU~DIb&)(sA89SQcH=R6ryLIdFGjCo_kV=o(1MvV4l>1q9=vuInF%Cnddn7q!2yn
zhaz|unJ2ZZ=t&`ZPB702<~hMVDMZgn<~hkcsl`Q43ej_lc}_9UDeg%jdeV<e@SJ9z
z)Doj7h3GlMJZG5a4ELlEJ!hHcEc2um8a*jQ&pGBf$2{k_Cxz%a&phXuC$-$@Ng;YJ
zFwX_%xxhUsM9)R$xyU@JMMqBx(X+%nOU$#xJt;Jvdxsrczm?|aoBmSv%Il|J#64P;
z$T{g?DdO$mE1kY~-#Aws9r%6U3Q=Llz)-YKfT;5V%A7kz-PW@T8(fCc>jlVqM_`$A
zoE0{@oJH#f$hsh~%(;+NbO&Ceu1@HGsB+h6XC6m8;XM8^t77!;oVKCfSwGOHD?{By
zu(`wGfBI(`ZNp1+#mZ0*U^Z%6XdBX1OTBm>a)QeT`kLN?=xnFYKT%2lPOqnu-cEm0
z71vXPZQrwB>?^OiTRCngj=so`JMLchuiC$*`L&;SAJ>1o`TFx0`;JWms`Q$q*V-c;
zXpTOpY1C7_b4q%D?7lpDXnjjpD#7T=@#M>+Xq-9i>Wh!`V152%|CgLOuWwR0*)M)L
zX!>3I_?(%|tCc_g_Lslu{xtPZcjkAmdz?D@Qk~@EmZf*J(ABm3EuU4RUg**_S98j5
zJfGk_pr=z>J9{+xh`w*kx>+M}|B_yr+h{chro_#%TtzpYv@DmU3nAasdE9!>q#m^T
z)R)pbnoK$N-gjvodM&@Txl~*jwC?Vt9_ir0v3vCNfusAqXT9Bi!#UVHyne6kb%L8^
j>aVh{S^gu3pkHMRed&~13)k8%h7+FA6#OuHW}@nU`oteS

literal 0
HcmV?d00001

-- 
2.27.0

