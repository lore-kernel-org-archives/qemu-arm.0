Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5365360wru;
        Tue, 31 Jul 2018 13:12:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd3rn2fBWPI10J3pSoIC8k/OBXP+fmOXvKIwGYWmu0PKvP/VjJayZKhK72M7vxBMBauAqaj
X-Received: by 2002:ac8:1b45:: with SMTP id p5-v6mr21530811qtk.99.1533067947969;
        Tue, 31 Jul 2018 13:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533067947; cv=none;
        d=google.com; s=arc-20160816;
        b=HOI/n1t0N9m92VEoFNUFSKj4zKBDTcCPt3lFDz09JWW6zhCxqRFyBsW0uobwe1Q4bk
         mgLIibdn5cOECxnYuu6YcWZDn/FGiLHL6RbtITeixbT4KK+yJ77SL5wVxouG7/ddahZG
         Wk4vmiWYmfEk7ARlXCu5842S5i46Vs9VZVdxiTaheP34D1O5TTSRtZPjJvNvVjp5k4JG
         9FoQL7KAQtZL4y1snq/BxpU0DROVqbcrbL3jaOa/AtLoHbRjprpuU7j+IWEsBre0JbEB
         HDDum3h/CY2zoNJobmGyoDqv2wrkRVww6Jd7hbJ+pamgP3eFUhrd34AOiKNrLZWttHZF
         3CBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :spamdiagnosticmetadata:spamdiagnosticoutput
         :content-transfer-encoding:mime-version:message-id:date:to
         :dkim-signature:arc-authentication-results;
        bh=aHASSC2X1eJJ8VJiEEW1GEDxrm1iC4JFKQIiht4/Zuw=;
        b=PWto9i4S2Ig0arZ5O29O7HSpwG/79b4pV78cs4A4H5d3J/XK1EYLIzMS+hEGnIrIV+
         8dnPsPZhhOCnKRQAGGqp4jV5Dd1SKx2raV4VQMCccC5Q0i0VNJ8RbPKsHku53unRLOg4
         k7D4fj8mi7ILwM/pgOKgH5eT6kteR/k7/GVCDZYzNa3I2wtnJ4LiRzxQNdUngdC5AnzE
         aWEQrzJrU4RnAI81Ttb5OIGwoDYvudOtgfs1oyTvqmI6Aol5I5SdQwNciUdNLctLKwvu
         T9jTcuIUJVqcgELKSSo/50LzVXEhqo4PchBYpe87PxHQOcUMwUeqgtooBmMgLMwmL74l
         5h8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@impinj.com header.s=selector1 header.b=jJFesQig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q22-v6si7188135qte.344.2018.07.31.13.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jul 2018 13:12:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@impinj.com header.s=selector1 header.b=jJFesQig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkb0N-0007cb-C4
	for alex.bennee@linaro.org; Tue, 31 Jul 2018 16:12:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tpiepho@impinj.com>) id 1fkb0B-0007cU-2G
	for qemu-arm@nongnu.org; Tue, 31 Jul 2018 16:12:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tpiepho@impinj.com>) id 1fkb07-0000BG-T8
	for qemu-arm@nongnu.org; Tue, 31 Jul 2018 16:12:15 -0400
Received: from mail-co1nam05on0731.outbound.protection.outlook.com
	([2a01:111:f400:fe50::731]:20000
	helo=NAM05-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <tpiepho@impinj.com>)
	id 1fkb07-00008X-Eb; Tue, 31 Jul 2018 16:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xJ5xRNxdsX/6cBKMWdsKZ6KS35jqtvR5/+wiDXBuE2o=;
	b=jJFesQigURGa5Yg7nPT14QaM4dfiAbp72LHt/Z/uLQmq/h3XlGn6JhceEtaxcqnQYZvjhPAcN8HAFKuCKgUjr/2UBK4NparyvsadLS6T7VZqlVPicrFU102QRR1lyel7thwkZNSPea2dvsZWCuOkrqo1A+9SZcs0Qk4u1FemvPU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tpiepho@impinj.com; 
Received: from impinj.com (216.207.205.253) by
	SN4PR0601MB3711.namprd06.prod.outlook.com (2603:10b6:803:4b::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.21;
	Tue, 31 Jul 2018 20:11:50 +0000
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 31 Jul 2018 13:10:56 -0700
Message-ID: <20180731201056.29257-1-tpiepho@impinj.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [216.207.205.253]
X-ClientProxiedBy: DM5PR16CA0047.namprd16.prod.outlook.com
	(2603:10b6:4:15::33) To SN4PR0601MB3711.namprd06.prod.outlook.com
	(2603:10b6:803:4b::33)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79729a86-47ca-4007-20e0-08d5f721da68
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:SN4PR0601MB3711; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0601MB3711;
	3:ivPvbWxc4/I83XvFTvvQqUS7JNuYOwNt4I0ijtGD4pu2KAtTxpDAv3qf6jBEUGrQWcSK/EONL1tqCxAkOFl9MfY58xircn74Pnevvjw91CbUaVDO2xhCP7Xl4M/UHzaFIF5KdUFStt0NGB/LCYanU0xtn+L3aFWoxkCReCgifIi0NhwaTFfqBYaITEl2c2frxuWeX6SNzZivoWRK6Xl2DcOo/OJVZGMU57hHaf+UWoW/tLIm040heUJ+eSNrfFpU;
	25:SGu7e/RakdaKOdB+apMYZ5+NQb7yzis8x6DoiVrKZdmGvoYPlT9aoIVLr1bFrYg8pNAcGXH6+Ka61R0R9O632H7cSH7BruQZ0igc2Seywa8GRcgbzq13y+4zyW/n3lZXufUGftnrDNNPh59cpmE/q2yabaTqUYfPK68woZgc27HxhTubWt+vgW77JgU3YoKL/gRoPgA30h4qM0BxEw0K4OnJts3h2vlWIzDSwfrunNub30CNwgvyz3YRmWevmZOsSvZ5PUTiBpQKr6NPDvyTFE8yOPn5MtutIotBBVCjOyK739kJhxEZfFAzhMXqN1oK/VDaX7LHBmdPMwCP2C4XSg==;
	31:znIVFHGcDtONunFgSI7utWXrRmGUiikCfObrviEtXuz0zk4LQeVdmbnubtL0v0qFpDWOteFFFru6ag0iNFvYDNI3wqBOgeSVtStHQRVOqZHQEROfbO53andbjKN+MOEYQDy4rdFRKYncF1TBE6j2Vwpg5+N+ZxoLoX3OTlzGjXh/6J8FjmU2ILUJxRCDTSCcttZHZjyfjA8hMRfPxPT5PvqH75J6IURmTelulWQuvM0=
X-MS-TrafficTypeDiagnostic: SN4PR0601MB3711:
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0601MB3711;
	20:BOhWEAtU4qsIDqCaf1jgKtm/tDYeQgMouqW6o4nPmDDdb7I+e8ueWFN6qgi1a2UUXq8D+xu22gxFh0d+IUp0GXEjXuLzv0WE+a/KTK+SfT+STNVv/eqoVQXZB2MBamf08Apra6mmnxm2czbHf4cEMRQGFw3QkbyLEYgmqO9E3XV8Kf6D7DuEZrJ4NzmfYq6r8NyxniwP2JMizSj0wxjjvVvYrynWJgoHavqs9hMsAY8SezU+S/Xyodur0Pu8JC23WN413cEl3MjFKhQW/7FEIK10IbCU3Bez7NvkpHd1Hjz2Vg+hZeVp/zwWqDMIxN6LvluuVXODv/cZu5vwyKua/pTFCX1wZzz9FF5wL+C9HSGV8WSUwvvINqqP75f4OTL/fzFkzSD5+LCbujSLESYOE7IT60Nw6yHCKtPu3Fd2hjcde4OWy6CsbgYM+h+Kp3vp2Be+Y8OT/ZFx5liOqR+7+1rhVKdQdg4o5jzWKdj+7IlackxG+uovfyJbrQFYaDPM;
	4:y8FzNnfm2cwlR/uVVyDI2tXyGcccP3eCk4YBYP8V8IiSGyFDZ3ltVEo3B8IAhb7AZM+k7Jfqsl0LgD3r8NaIAI3AYCw3u4Dw+ybOfoiKZ3dRlaJheBbVhyVpm6hzyQYdKHlLg1qGR8O2i2oe31Dr1XpRIxA9bp7ZgyEyR7cMfM5wv15yYeTjivUeI0H2SP1YIRW/ZVVAKNGKaIyVtnIKEPTrvAnALuWrYpAVMeEXi1lmHYOs/1dlQRzdUCM40yI2Uej/qvetZSjKaXLq5HU4OQ==
X-Microsoft-Antispam-PRVS: <SN4PR0601MB3711BF4F4A4CCB5CA5E9AAE6D32E0@SN4PR0601MB3711.namprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231311)(944501410)(52105095)(149027)(150027)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:SN4PR0601MB3711; BCL:0; PCL:0; RULEID:;
	SRVR:SN4PR0601MB3711; 
X-Forefront-PRVS: 0750463DC9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(39850400004)(396003)(376002)(366004)(199004)(189003)(8936002)(486006)(68736007)(97736004)(5660300001)(3846002)(6116002)(25786009)(386003)(66066001)(47776003)(1857600001)(8676002)(7736002)(86362001)(305945005)(81166006)(53936002)(81156014)(36756003)(105586002)(26005)(478600001)(21086003)(16526019)(2906002)(106356001)(2870700001)(50226002)(7696005)(23676004)(186003)(107886003)(4326008)(1076002)(52116002)(50466002)(55016002)(476003)(316002)(54906003)(2616005)(956004)(69596002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN4PR0601MB3711; H:impinj.com;
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: impinj.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN4PR0601MB3711;
	23:XruqDCf6DXtxuwiO4SHTUI1vNGOb5l6s/28tPBK?=
	=?us-ascii?Q?uokYkPzVPYKBkXxi87LyzYdhRMmtDRfasfg/3Vu5T/JHvJIGEqcI+gM4pdIq?=
	=?us-ascii?Q?1VCrLAov3m4TOaKaKGPRi8N8U0c5a+744NfWw42Ubvj3u9s0nl/JBh1jr5yf?=
	=?us-ascii?Q?/OgVQqvz/54ysCIlQfVPb+cpiQcJyKAGqkmeUkhLmRm0kuN19wBO22oPk0M3?=
	=?us-ascii?Q?1YlwPdSySh4n+7ruzFk04mY7IiRV16yie2J764Po8m3tBnuWKFU1l/gnZ4EE?=
	=?us-ascii?Q?mM/9c5rnU/tEcKkA8Jf+oFGawaa9rfH7dLObkyhW8e+G9U6EFh7I3mf6yREn?=
	=?us-ascii?Q?Ke8GRPDp+tZTan9jwfpV/1wqM6t5Duu4ojJPL4YCCMfc3jzVnBtLofQI6uE9?=
	=?us-ascii?Q?rK9FWdTIQJige+btTd2cfONJtwUJtBBmRtEAzaQpB4Zk4EpN4HwAn402IwCw?=
	=?us-ascii?Q?ujOByXI7b3UtWK/Fh+Ti8laiHvhKiyIDAL6Md22U6WwhetfngVg8AObqLaZQ?=
	=?us-ascii?Q?7LtHuX408LLfwXpEjBT0kXfWi5mI3d63GIfWgy3EnOkAlm/c0S/h4sL5AB8W?=
	=?us-ascii?Q?sSFxXivFT9kuL5Un2SDOg1XQqUpy1nFmv0jyv8maAxclEACaXkd3YTBYk5uj?=
	=?us-ascii?Q?Z+ij6oPvkS30zKFELVALOBwABqsMPKyfelPr1+QWwouMyiy5n6cwD1F7UcO9?=
	=?us-ascii?Q?PZaLeLCmYCHj76OI8QHWODki4SoUbJ3Av0qZuEJ5XvCg1Mp5OP9cL079kT4M?=
	=?us-ascii?Q?/Q2l2VaiZgzRCP2DtXmTSnSUjEiDdPu6/s4Loo1vX8n5HvQqNdjG/3E8S5LY?=
	=?us-ascii?Q?M1N0g453Rf5Chxj/bRG9OoJguqOuzhBontFwIu3mAYWIuT8makte/ybpbBGv?=
	=?us-ascii?Q?UbLtdnDOi9UxQy4x2sXe1fMmTsjjsKHcL8L7lvVxpGORQOab2STUrXOlt7i+?=
	=?us-ascii?Q?bH3d82YfsZEsh2ShfKVDHxTonHcwzdgab37ozY9DVHWxmFccxk9o7vUKLA7F?=
	=?us-ascii?Q?lj4ipUCfn1ZPNHQe0qZr9D6dpAW+Fzu4TMqEI+b7nN2CQ4LPjbgXI30Th7UE?=
	=?us-ascii?Q?jefJiNp3aETptWQWCpKNPMKp5bkB0CpIEkkKJFZVeWjXep+faGR5A5EfSIfz?=
	=?us-ascii?Q?cbOB+OnISQMN/McPTpRgJU2agsPjIE+a2MT8BPsxWz5o0USDGzQOKiw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: mP3qYEA5mS51QYiScEUlM5JgxJPeMIMedqO1ppR3hldDle92sadhkBBdL3+gmXnpmSjGVyWOtHxuH6Vd2/n/qDZQElnOTR1kx7j8iEvI87r+jArrkLG5j1/HNH1+LAODWLBEuPg/u3j8qg2S4awbKIZB1s1U+GMdlzz3Tcwt2oPRuNl34wfikOGdBBiSvfLRgQ5FONj0rrj7tW7emlFJYAdHR98qZKrlH/WRHRKnotiJeD3oeCAmCCtlhSrC2cS9y/l6G8NnviSE1PT27BdAgPR07ai770396yozdl86kAMHjdHVTOQURO6GC+zklx74CO/K55XIaKdghQ6YIRNePlLsgx5d5/25gTcb8asATks=
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0601MB3711;
	6:6J2EzpfHKyWONBR7wDg0t/9H7puv1lTrHE9QNiYV8+L7CW9rzXUoimI7akxa6fl1euPgqqIKg1/6ixRDUlNogjUnrJv1/mQTHQZh9Nc4gC6FkspNRv0SQp9B5ibWtQn2VACKzFNLevb+zKwodVltPZo6WHfugUuZhxhRFhTOCs14SjoltATFEi8YXpHYG43yuhvIJ5e5QRaIHvRTgXiu/oyS+NApRTvafeR2MVQ2+I68DU+pG7bboF79zh9CF3m78Pg46Wo7ulhTef+U8GGRlyYW7AypO81mZQwSaMwK/BAu4G99dvAA7zSJGsMfD8apiWCvCcV0SGuCWf7oPbLcMvIolQx12cCjeDrk4aPAiIaib15Y1jDsp7fjusA0edqLGT7v8RWKnB0EcZwn/fPZvlnpL4EP1NuAux+D5QVHtvNnEQjXMDvA6OG1/yKwK6AJ9l7c4h0iu+n1q3smY52EkA==;
	5:xqiHSK3pDFMZg/nh+aAY3Aylgx02xsZh5oHWto9BJOZ+pylL+KIhz/982c9YkkdiF+CpDqCUuMKLyDneLHhm6nGQwqoBpGcgc7yJyI3kmh0j3Ybsg/1i56fvySoJpdBrGb/NOCNqYO3e0G2q/b6D2y5hAq8oI1DJtR2ftsw1ISM=;
	7:X1PUoVlmk92D5ZxvUI60//OapBBE290QnC5QzcM2NUccx2i8AwnM+uxSQPmPrd9799Oufmg+1hn4LQWYYmbbyhQ/15j2vGtw00TzbFlZ0nTFP08vGbOZHKzD4J4Y1pX/OHVj9fX0nbjSFDmuj+gfmFFyGsURE0k3INGnvYG7dU24e95Vci6moGZr9WwHbwCHk2sEKo2Zf24dx5+Ocrvv/mnry7q3+KCYu3vX/KutL7W6frBdu52uO1gDAnYyPYqt
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2018 20:11:50.8375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79729a86-47ca-4007-20e0-08d5f721da68
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0601MB3711
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe50::731
Subject: [Qemu-arm] [PATCH] imx_spi: Unset XCH when TX FIFO becomes empty
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
From: Trent Piepho via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Trent Piepho <tpiepho@impinj.com>
Cc: Peter Chubb <peter.chubb@nicta.com.au>, Trent Piepho <tpiepho@impinj.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w2MDJ+CGKIre

The current emulation will clear the XCH bit when a burst finishes.
This is not quite correct.  According to the i.MX7d referemce manual,
Rev 0.1, =C2=A710.1.7.3:

    This bit [XCH] is cleared automatically when all data in the TXFIFO
    and the shift register has been shifted out.

So XCH should be cleared when the FIFO empties, not on completion of a
burst.  The FIFO is 64 x 32 bits =3D 2048 bits, while the max burst size
is larger at 4096 bits.  So it's possible that the burst is not finished
after the TXFIFO empties.

Sending a large block (> 2048 bits) with the Linux driver will use a
burst that is larger than the TXFIFO.  After the TXFIFO has emptied XCH
does not become unset, as the burst is not yet finished.

What should happen after the TXFIFO empties is the driver will refill it
and set XCH.  The rising edge of XCH will trigger another transfer to
begin.  However, since the emulation does not set XCH to 0, there is no
rising edge and the next trasfer never begins.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 hw/ssi/imx_spi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index b66505ca49..02c38c9e47 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -208,8 +208,6 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
         }
=20
         if (s->burst_length <=3D 0) {
-            s->regs[ECSPI_CONREG] &=3D ~ECSPI_CONREG_XCH;
-
             if (!imx_spi_is_multiple_master_burst(s)) {
                 s->regs[ECSPI_STATREG] |=3D ECSPI_STATREG_TC;
                 break;
@@ -219,6 +217,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
=20
     if (fifo32_is_empty(&s->tx_fifo)) {
         s->regs[ECSPI_STATREG] |=3D ECSPI_STATREG_TC;
+        s->regs[ECSPI_CONREG] &=3D ~ECSPI_CONREG_XCH;
     }
=20
     /* TODO: We should also use TDR and RDR bits */
--=20
2.14.4

