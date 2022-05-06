Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2027373lfj;
        Fri, 6 May 2022 12:34:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPlg5etcXm9RRjuZBx+uifQyA8+CI+KSKpdrUMnwuktXPpubmjyi/a/B8tFdTF+NegHKEK
X-Received: by 2002:a37:3cb:0:b0:69f:b6d8:db05 with SMTP id 194-20020a3703cb000000b0069fb6d8db05mr3626451qkd.339.1651865664383;
        Fri, 06 May 2022 12:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651865664; cv=none;
        d=google.com; s=arc-20160816;
        b=Bieio6/cP56mOSoWFZYxDBwzd/a9qRcYlCrtv7vs17/66geUop7x/ZDY5jwRfRChBr
         AYoJ2Fjy+EmDNwJ+jSbpyrmnhj7T9do/i7AMwcXUl/AZarn9ZEr8fuE9fMOMkV1WZ77U
         M/9rzS5QnD9PMut1m4dHSuSi72ccLPsLRyGyA3FDpgmnZYaYEC2D+nvGdEpPJgBv8rCe
         mj3A5dssjLoic3TbOAuB64s6XG/4W8l4kEUHEYN2dKUImfDGTtuJpISugKEw0g6VD2lP
         fs6NjPZFwhmuksqE0mXzbVSjhbFK3PNnS/lIH9jizcoIj420VA8JgmOKqTQU/Urqaj0w
         O6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Ix6CeN7RMOZa0r/fAlRDM6WYeFJ+uPAP2MbUAKjns5g=;
        b=tgqca/vYMYFrvLSosLmZ/6HJXaLMrf13J6vkDF2IlMrRCfJ7jlN5BYmnsPupivoIMq
         houcJfU9qflGdUEHON3thYv5yWzoKpF96wSA5dQi8nRXakhHlmprM7haI2KwK3KXZy4O
         15x2z/a4LGmaNnCXcU2PzMhb3hS7lI0bkSUYYWvY9zFZM5o31X2AzvCc2qLD78b3utWZ
         S2zRobplCD1HIYUshymhI9KHU99dm14FzLV+wQqX8wrYUbSXHw2y5JdSzz1bFgj43Dm0
         RndEVkHQhO5E8T42EUG4U045iqGjoPtJCke0LDfeV4TBmZBOlaDGlPZNaUR+95kQ/i0E
         aHrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=k0ZNBpbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05622a179300b002f3a7ec56e1si3033678qtk.645.2022.05.06.12.34.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 12:34:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=k0ZNBpbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn3iZ-00062I-TZ
	for alex.bennee@linaro.org; Fri, 06 May 2022 15:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6125b5e310=pdel@fb.com>)
 id 1nn3iO-00061O-Bv
 for qemu-arm@nongnu.org; Fri, 06 May 2022 15:34:12 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:18876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6125b5e310=pdel@fb.com>)
 id 1nn3iM-00028J-Ig
 for qemu-arm@nongnu.org; Fri, 06 May 2022 15:34:12 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246CI8DS019159
 for <qemu-arm@nongnu.org>; Fri, 6 May 2022 12:34:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=Ix6CeN7RMOZa0r/fAlRDM6WYeFJ+uPAP2MbUAKjns5g=;
 b=k0ZNBpbAkIs47EFjgb3TXzUHP75BjFkFa47JVge/Cq/ABaB0hx3JJF5Ij7QQxRqmdFiQ
 6bfL86P8aby5U87Wc6BzJwbZ2Ev4376YOntXQdrBxWCQq+peOrIqFhMQP367PZuc+3nQ
 JYwVsrimEli1NOJgRbIZ71w2S9mHOOBWA5g= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fw3jfapth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 12:34:08 -0700
Received: from twshared13315.14.prn3.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 6 May 2022 12:34:06 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id F3A815D276FB; Fri,  6 May 2022 12:33:58 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <clg@kaod.org>
Subject: [PATCH 0/1] docs: aspeed: Add fby35 board
Date: Fri, 6 May 2022 12:33:53 -0700
Message-ID: <20220506193354.990532-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: HHCgvKwlK35B8VHMoGI-F1bThGcJIUoc
X-Proofpoint-ORIG-GUID: HHCgvKwlK35B8VHMoGI-F1bThGcJIUoc
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_07,2022-05-06_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=6125b5e310=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DxyVwXpESFuP

Adding fby35 to the list of Aspeed boards in the QEMU documentation, per
Cedric's request[1]. This is intended to be merged with the patch adding the
machine definition[2].

[1] https://lore.kernel.org/qemu-devel/97674ac7-17c5-06cf-6bd0-0e7acc37abcc=
@kaod.org/
[2] https://lore.kernel.org/qemu-devel/20220503225925.1798324-1-pdel@fb.com/

Peter Delevoryas (1):
  docs: aspeed: Add fby35 board

 docs/system/arm/aspeed.rst | 1 +
 1 file changed, 1 insertion(+)

--=20
2.30.2

