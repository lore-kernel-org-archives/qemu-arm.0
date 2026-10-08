Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75B6CA600D
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 16:02:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEqZ1-00017B-70; Thu, 08 Oct 2026 12:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEqYj-0000pn-PY
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 12:01:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEqYi-0003Yj-2Z
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 12:01:29 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 698EVFLJ4148806
 for <qemu-arm@nongnu.org>; Thu, 8 Oct 2026 16:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RlUTbroe5EhMNOk/M2KxixZlfsLguukaisJJfZtPO1c=; b=HAUXh8Y4FYa72O+a
 V4Z+WsYPv65eHu+OMqUWnfzrOK+LT9Fb904JPzrGiykLXXnYH+acYTJyIYjw1t8k
 LhwtGY3mN6zHTDdZ2jaD3GUr7aIpS4tMa9g8L95iw7oA2ntvEGScR7A82N4/gkvm
 obJBTyIH5p2NAlQwKnOLfMtgdjEsjhiYi+nh30QR/ZZXfAeG1DdlPc66uLLchGSF
 yupgxQW4ssfh+jOMqR6ISXN6E+o9jByY8HrnW6vZLOrgFK5dREBs4Om3iuBXk+N3
 89um0Qiwrkrm8bja5VHLlhsgJ5nXBFEopfKwBDY7SbQssNuwCVjE4eGnrPsvOj3d
 0NSh8w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6bp0q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 16:01:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-34ef0362d95so10667495eec.1
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 09:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791475283; x=1792080083; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RlUTbroe5EhMNOk/M2KxixZlfsLguukaisJJfZtPO1c=;
 b=BoaDO0Wh2quLYwouQGxKgfvaJRzF76HF/f5RvbCGYTuDEZhjNqTR0wqF9EvLhnNC9o
 Ez8kxqqMtKI39Sru0IJ6y1kgPhi2AWimEF4dR+VNa9tiTRCnk9JTtB10p3+d+zTetgYq
 JvSrugcqjQ1WgIA2h6rXPiiEAuFkE/2zFFWGm7Uy4KjS9Wy5WBacTZ3C7/q9SGesITo/
 gjQJSz4HaenWKTuedMMeW01HBLRNpkxW7t9N8aerFP5sKUBwFUjLpSAwHbvdEhUZGft6
 kcDfZZ1+801OXiX/vS8MbOux8RlQvkfVGCDw9rGkvM1aAwR+SRSkpdubuvyRHlb/4Uyv
 54yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791475283; x=1792080083;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RlUTbroe5EhMNOk/M2KxixZlfsLguukaisJJfZtPO1c=;
 b=kesnUqZyi4giQTgi62aHn4fS57IZnY5bQjjDOiDnPzGmqtPcMxyFMxW+hr83f7IjpG
 0Du7PbXLgR4gRuBR3srvHUW7XdPgBlAG2dmXJjK9oeIVcwnH/2KCWjb9SKjU+qduZK6A
 ytD7OQZ72tHDD8GobUCfvkknlvB8FRfEPKO3pJQ0C4rEq1E0nyCJRH9atl4WLfg+EvHa
 iEKz0bKpPLYNqfUfv9Q390hfcvGorCHlug00GHreuAIT6vKhpobeeNsiwJG+/ZGxKSro
 FOqoves90xU1TBDGSVFLUP/iBx56k7LZ8NL1Ash3s7tY/NxdS30xKC06uos6+yGXuKeb
 +6jw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxY4QJlyo2BKW982d5ybK7ylb2ngocVy38nTzsiNo1yJqxhP2Bi3LCIw7v4QiCTvhXELByvJ+QDoA==@nongnu.org
X-Gm-Message-State: AFq9FYK9tsDyvwD/zwl9eZgWf/y3a7VvliCchfb6dgXN313xYT5zuXkV
 XYFb+7gTBOkpNpljOtF+e+BU95GnJsi5JughmmQ9ZHeV5KFhlUtYcDYHd0nkXdHUc39KKW8eu0I
 L7WfGOn8eVGf+EaXe9QbCx0s7thW3Z2oU4Zii5JbDF4zzl3CymWpAgdM=
X-Gm-Gg: AYBFou1xzrfBLLiDQIXriQKVqo17mRg/33eDUyowDP4/gKykeXboPOv7Orh3KD94dHf
 DXQXNuwLDCjLfkjwOM56Bv7QxGDTZXAli0nlCL2UO42folUFJboJ7xL537vjBjpRXgD4dM96E2d
 zsfHddNgyeUy9qQeM2Fw9tUs11NDnPu2i2nFi1P/iWMP9Fey04SUVCdw19bTZOa9KVwkQIfendb
 ObfwjgBag3InVHvitlATqi9MskBdMckTn1DAf9zpQ6O22FiuMrpFSFRj8Y+o/vwHbHzXUshCVZx
 azJShvcRMvNBNBmyBzkJaJ8b8hgN1vsARHLHkdbN/cAWkL2PgwEDaJCFWcO33iz+J5TTc1WHls9
 6gUtu5wz7CpnTcHIEvSPSyja7QJn35fuT+TboaDH8cW7Zd8xBPJsN2jZHxne6gIMHyuMGlg==
X-Received: by 2002:a05:7300:51ec:b0:351:7c72:a8b with SMTP id
 5a478bee46e88-3517c720eeamr3280343eec.13.1791475282881; 
 Thu, 08 Oct 2026 09:01:22 -0700 (PDT)
X-Received: by 2002:a05:7300:51ec:b0:351:7c72:a8b with SMTP id
 5a478bee46e88-3517c720eeamr3280260eec.13.1791475281880; 
 Thu, 08 Oct 2026 09:01:21 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3515b02d552sm30047307eec.28.2026.10.08.09.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 09:01:21 -0700 (PDT)
Message-ID: <98644e74-9219-42f0-bcf7-8cd7f02353af@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 09:01:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] qom: pass TargetInfo to is_available for later use
To: luoyonggang@gmail.com, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <20261007115253.328-9-luoyonggang@gmail.com>
 <7fc0d377-a994-41f4-aa98-7ed56db11447@oss.qualcomm.com>
 <CAE2XoE8K+3e8h6H9NrPk1WWMmJfG807bN_Kh5qje-5pKWUUg5w@mail.gmail.com>
 <b2d89a92-0197-4873-b4ea-75bb21c0d0ae@oss.qualcomm.com>
 <asdkF80SJzF2W3sD@redhat.com>
 <CAE2XoE-Vc+CaE-3FerW3eXtTgspwxZJ6ZT0CZyg3ZYpoJ8xYXw@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE-Vc+CaE-3FerW3eXtTgspwxZJ6ZT0CZyg3ZYpoJ8xYXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac7be53 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=v0Zkhkck_tOZKS5kyTIA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ECpKojW3YlxurwgVoCMtg1OxFAJfz740
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2MyBTYWx0ZWRfX4LS1yfsifOo3
 YupvQ4E5ZQhZvu0sfNNJG7OZO39NiZikT0HQ82AFWgopIzDkyGMDfLNjnJQAOfN8q8aloWkt0ag
 d2rDNc/hfOVW53qYGj8unGB57QklvYwthHA1W+tohJT17LnN7N8+8Jnr/dzP0hSQsz/IOJbqeM4
 pOn6r1pMTxQSCrVPPctTS3tO5dtcSPktN6dbAx7vXASiEKlJ+zxakqRx85anxPhxptP9lbrV3z7
 tGtz2rLWqV6WTMi+gs28A5gKmm3a5FZcCY23/25imQ3pQWqoTb0IOnA6Su/3ITAOgznM8snLNFX
 9SLV1kX0l2w2SlABfw3yFT+ZDsX46oeWZmTMQMrcn5mMg6p0xCZQ85xZDbbkgK+aFRN5mPNmD4n
 a01qa125DY0WuG7/N/Zx9hG6suitTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2MyBTYWx0ZWRfX/evfhWuqXzNA
 CHjbZNP+dnVOkClZbjBoZtyME43X5InlCP8GHai1fi7e0hayyZrpKiMKE3POXnxve3hTpd8tE66
 4eSTHtHJyMYstyJfcDH65w0EMkF6QxI=
X-Proofpoint-ORIG-GUID: ECpKojW3YlxurwgVoCMtg1OxFAJfz740
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610020000 definitions=main-2610080063
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/8/2026 2:56 AM, Yonggang Luo wrote:
>>> How about letting machines (and machines only first), have a new field
>>> 'targets', being a uint32_t mask with an array of EMU_TARGET?
>>> machine->targets = EMU_TARGET_X | EMU_TARGET_Y;
> 
> To be explicit state what, I give you a pseudo code to compute
> machine->targets from TypeInfo::is_available(TargetInfo*)
> let targets=0
> foreach ti of TargetInfo list:
>    if (machine::TypeImpl::is_avaible(ti))
>          targets |= 1 << ti->target_arch
>    fi
> endif
> So they basically have equivalent effect, and is_available will handle
> other code-needed condition properly such as
> CPU/AccelClass. not restrict to targets, we can also attach the
> KConfig into TargetInfo, so is_available(TargetInfo*)
> also works for Kconfig. that's why I insist this way, it's solved all
> the issues around.
> 
> so  machine->targets = EMU_TARGET_X | EMU_TARGET_Y; is a good idea,
> and it can be implemented with TypeInfo::is_available(TargetInfo*)
> without much burden. and targets can be saved into a (machine or
> TypeImpl) for fast access when needed, we can compute it
> when the program starts.
>

In what we described, there is no need to keep any kind of callback,
targets field is sufficient to filter any type declaratively.

For the KConfig related types, I would really be keen to leave that
available for now, and add a proper error message later.

Regards,
Pierrick

