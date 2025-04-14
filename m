Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp1846297njc;
        Mon, 14 Apr 2025 01:08:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVf4ONUtlJG7oj1kZXxsmYE/RQwYZ44Myc2e3v892aMHnCpcbBwkvpgnqOc5btYZ6dBK8vRmyUr5LIa4A==@linaro.org
X-Google-Smtp-Source: AGHT+IGnuqDlHVC6/HZCeAricucRp5fUiG0VClW7M/d3YJRMT3X3k8rA2Qa1tgS6NFMsGUPg2Ebf
X-Received: by 2002:ad4:5f46:0:b0:6e6:6b5b:e559 with SMTP id 6a1803df08f44-6f23f17d05cmr194976696d6.34.1744618121462;
        Mon, 14 Apr 2025 01:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744618121; cv=none;
        d=google.com; s=arc-20240605;
        b=SL95BnN6mv+dXvOcMCYq+/niKlfphQnHeQWR94qg1S+Z7fxIoaavPSj8x6w/ZFEHP5
         qArvwopKpKkLwZjifOcGH2tHhrVDTo+sibCjXCcptdCP593g9c045MA+mKrjZrzKS8+J
         JhfUdx0y+mUSlJ9EUJ7sw8boZX7HrKPUlnx7KsVRG3WC4JrYuIcHDK/IufXp6l5A/DrC
         XuDBPjff6ZMSJjpBj7cAYU2+fGpa65hs3SmInD8rfbVZJfJJd1ziiejdp2bHB8ZjGI66
         LlU2bHnzXrvHeDlk1obEGbj0T5lpOs55t4FK39yLCvXlXX5+KivxjFmKZKobJ4+CYsCj
         tz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=d+IXLMoawXqX/xjHW2ZgqT+C1iQaEI+DOzSb9WG04Vg=;
        fh=asUnrPniG2YYcb+fCtyclp1rFGZvq3KjpqNkk5EM86g=;
        b=d2o5l2oaCqjsHOlLQKpqQTN9Z8lR9sWtQl3VuBmqEA+NeMAhGWjSlIZ92ArVS8N0Wh
         kPg5Qyl2p5Gzzb1va+4iTCsm/G1P/XcWTs7Lu8gnn+byiIH33/hxfSHWMKDivchZNCSt
         ck/UN1SZMg3lgjttbAl3SucvOq05q1bdI4PeaW2WEXr+Q+lzXXcHCvXKcQ8PGp52riAw
         hdEGPODnlUuxrLVLGQKnR1o4xcoMs/XPpVVQ+Rza9Qz4ZXBcJ6beuVovIanFym6K9nFQ
         tqNGE2XLqxfGOCSdLwIk0GQKUQByDB7hHzVrxnfNQcP8uztW8HmXZyRhfPnmdrKZbtdf
         bP/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=jukc+wKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de9ecc49si100416066d6.311.2025.04.14.01.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Apr 2025 01:08:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=jukc+wKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4ErH-00053j-W8; Mon, 14 Apr 2025 04:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1u4ErA-00052y-3v
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 04:07:52 -0400
Received: from p-east3-cluster1-host4-snip4-7.eps.apple.com ([57.103.87.40]
 helo=outbound.qs.icloud.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1u4Er4-0003Ej-0P
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 04:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 bh=d+IXLMoawXqX/xjHW2ZgqT+C1iQaEI+DOzSb9WG04Vg=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
 b=jukc+wKCWyKwyo++K+D16oo9ApqpdsW/JjsDQLrIy6H9q/hJw3Nwq9YxNys6UMCo5
 FvhP00PjJ4Q4lFdh+XTjuYgpSWiVYDmh+ftO/PR8VVlS+wJanVjOkIt4WtEQbgtiVQ
 vyspHZcB6I6VPeufD1T2fNes6FHgRTY+zhnn4X7nzs9fx2flzsph+z7+hyX72dwCkT
 STZoX81z2F0wjOwXiaGpg2rCfQSuBApqNqyW3VM/LW7r5uQL0aUknoMhbotVN0Zvgl
 NnX3/2i1LFTrWwHrA29ZbLFGxplo6rjFyu63yVDTwiyqK6DF/UT4Yfkco9+gpw7Mr3
 QsPqYZxuF7xUw==
Received: from smtpclient.apple (qs-asmtp-me-k8s.p00.prod.me.com
 [17.57.155.37])
 by outbound.qs.icloud.com (Postfix) with ESMTPSA id F20D118005F5;
 Mon, 14 Apr 2025 08:07:39 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH 0/2] Fix GDB support for macOS hvf
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20250402135229.28143-1-mads@ynddal.dk>
Date: Mon, 14 Apr 2025 10:07:26 +0200
Cc: qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <m.ynddal@samsung.com>, Daniel Gomez <da.gomez@samsung.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <13247C25-632F-444B-BAAC-648490F1B4FA@ynddal.dk>
References: <20250402135229.28143-1-mads@ynddal.dk>
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-ORIG-GUID: AHtOJgL35LJa09qbRarPzhSU5FAaVtUf
X-Proofpoint-GUID: AHtOJgL35LJa09qbRarPzhSU5FAaVtUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=707 adultscore=0 spamscore=0
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2504140057
Received-SPF: pass client-ip=57.103.87.40; envelope-from=mads@ynddal.dk;
 helo=outbound.qs.icloud.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 01/z8gOT/4GV


> In (recent versions of?) macOS, calls to hv_vcpu_set_sys_reg were =
failing if
> they were issued outside of the specific thread that owns the vCPU.
>=20
> This caused a crash when attaching a debugger through the GDB stub.
>=20
> This GDB stub has worked before, so it is unclear if Apple changed the
> behavior of the function in a release of macOS.
>=20
> Mads Ynddal (2):
>  hvf: avoid repeatedly setting trap debug for each cpu
>  hvf: only update sysreg from owning thread
>=20
> accel/hvf/hvf-all.c  |  7 ++++++-
> target/arm/hvf/hvf.c | 27 +++++++++++----------------
> 2 files changed, 17 insertions(+), 17 deletions(-)
>=20

Daniel Gomez and I have been using this patch for the past two weeks. It =
seems to be the right fix for the issue.

=E2=80=94
Mads Ynddal=
