Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD14C5DF8C
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 22:17:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxB4F-0005l3-Mp; Thu, 20 Aug 2026 18:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxB49-0005kV-GV
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:16:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxB47-0007rE-HG
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:16:53 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7YjW807246
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2MPXZ7D/e9PSjB3nPi1GNR2NWNs0UUc/omjZdZZ+H+g=; b=dSCKNBwAcJL0Ez3z
 1voo0IbEN5qRuHQP0Y0cHn8+DmrJIso1Lt9DyiMB9crcZ2XD9niS6rooHI4Qpnxz
 3LS5PlwA5xFYNY+uFrCVDtBQSQyG07QJRpllMlwRdb3EzOoiF9SuciN/6gzaFeIW
 XdtjUDe9fa5r1qdtGizQi2aIWhmpWuC97PFrGudo6XU17nFIPm4CP070YMnCGvPK
 e3sp1Lg8XHVG0GMDAsRiTNK2Fucf1N2wdkXIIDNjEe+EF0XJiXZSJtaWUErHpZ1R
 CB5Ucs1d/II50e6W/okFMrg2oTJykvMaZ+rNlvn0AlMQigXTWRzYkYjxM78tFyiY
 v4eyAQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcbf1q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:16:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-38ea32e57e2so506266a91.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 15:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787264207; x=1787869007; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2MPXZ7D/e9PSjB3nPi1GNR2NWNs0UUc/omjZdZZ+H+g=;
 b=etQQc+v9PJiZ+Fh3LFYuQ1CUeSH/nLBn1N/MvfT7E4s8SUdml1HoTdiaOF5fRWvETu
 38xq9koAEPDwM1GjpGf1PrxFxVKCpINxJD2tapTflH9vHuodzDdS0yAyYwXTSyZ+nSkl
 O0yjQcE1A7YNtb0FayfRSB9h4PPpqXEAAZL05ff8c7CMJyBcaLQINB4PhJQG4HW2W+XL
 QD3E0K4Nkz9hNNdvtbbdhPrPhcvjeOwbjAs9I9lN25q0L0UPoE3fqU58OBEUlksmupS2
 62jW+UBSpNNuiv/406CWejrE1iapqLp3iFv6buQ06Q+7H8Kv5otIH7iguWS+6cgBy3QN
 3kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787264207; x=1787869007;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2MPXZ7D/e9PSjB3nPi1GNR2NWNs0UUc/omjZdZZ+H+g=;
 b=YWF4Li5bRdP21UwzoONd3FfPFsL9b73syfVXt6K5Gv3Q25ZgPdCi0J99iBlN2CZmuY
 Ele+3ltFM363fLl02d0l3hS6HanagUiSR0/jT1pU596Ug9Bk87jsKGpt4PNIQ6bWZw2O
 JfRtU7wmiF8uAajyfYwmfxXyFlux2VuRFkoHEouxFxNY116nPejSnrYHnGhBgb/1lFO1
 yHJwG9GWsyQ5NbCYIyFF22bsw6gkwEsXfMfURvejq0Jxs/8wAkkORSlgagpkLXY/9Pnt
 hrszE6ytpwCmTEFr53ygAwwpfYLwHYB17Vjm9aHrtNgdjxkg16S7yRVoYAFzBp9vZS19
 6hJg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpqEMD43trdO7Nb5TBtQ9V2iSakGjxS7TAeCHSUu8Xn6HZSg6zOwT/vQIfvSVg6ass6jgGwcZKpJA==@nongnu.org
X-Gm-Message-State: AFuF++mCzhr7di8kcux0CB3vJvp693GQOSVK28XD2Zc2kqwK0xtE6JYg
 RAjzxK8sQOV1A3hjV6ODAN7aQliULgoQmc6acbAQ+YZ51/lfShIvNPldCRDwMCflEJMl7922gQQ
 Egs+ajf1UZoJHpM5X9cmvi3C8YIgDb8ySiuBbp0R3plZY0TRsKsm56qg=
X-Gm-Gg: AR+sD10rgY4/hpLZr8RJ+Wm7u1rhpDGAJFf47H12dYwf030YF2gtYy2AqESCs4H7dJd
 RNdYjjkV1YEv7llmcy5m57dTtYnyDhp15SBBG3Zm0x8uxj86aOF6F51VZ+LvzPjw+zpzaQL9+Ag
 DzOs6VwayGaRIX+5hUVZsS3StXgJV+7HvW5Kag9EJQuQ38lVTMZS2XhKdCWB/X9McsrTk9IhAJ+
 ahHHpRV3Tboy4JzEzCM/HkOiNJmy0/ldK9OcYT4L/NsaLlQMqDXpzGjIJqFsWUJUEQoYObE4Zu8
 7zci6D+WAejkb8XLxoRWiA0rlhXuc2l1JoiMCLjSEJrVR5Upg3Jds6FYLneZNlAPoOC+RrZrwMH
 w+hVW29oD6ptRHvU5ijkHFQZMWkb37Pl4wrwUr5ltjeNyPUtgu5Vf2seZlmKCNHFhF72M
X-Received: by 2002:a17:90b:3d85:b0:395:4de0:b78f with SMTP id
 98e67ed59e1d1-395c33ef91bmr3208101a91.1.1787264207249; 
 Thu, 20 Aug 2026 15:16:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3d85:b0:395:4de0:b78f with SMTP id
 98e67ed59e1d1-395c33ef91bmr3207926a91.1.1787264206226; 
 Thu, 20 Aug 2026 15:16:46 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1416ae14162sm18727395c88.9.2026.08.20.15.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 15:16:45 -0700 (PDT)
Message-ID: <0a4c3e34-574a-484c-8617-3af587f080fa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 15:16:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 00/28] hw/arm/smmuv3: Support Secure state for SMMUv3
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>,
 Chao Liu <chao.liu@processmission.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a877cd0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=fgrLqfBXAAAA:8 a=KKAkSRfTAAAA:8 a=ZYi_vuD_AAAA:8
 a=ehYRL7wMAAAA:20 a=EUspDBNiAAAA:8 a=uVuSfXj6EEEykST30esA:9
 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=_Ge82aPy-h_wFa7gWU4u:22 a=cvBusfyB2V15izCimMoJ:22 a=BPQQxL4JNPAPRa8Tzepp:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: CkkTIizblfPoBPmnelxglOoJfOPaJuT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2NiBTYWx0ZWRfX5iHCVHE8RqwM
 B7GerY8s/3IKFjK+6GiHXQnyw329VwwBosmTvJhP8YssIzBp/bGgPAQbPKEKNuOB/CLArh49Oi8
 Hmb3VGaAmX4UgmfLkwTsUHxYCGRhKqH7EmC7jt9IxpT1Jn9HeSTj+4DHrTISdelc65flBpEVUeM
 G/4oKPyYA23KyeJkZQNhTvWagYJgZVKPBHrLbeZUtEI4CxDyjYQGgAdJ/OzCkxSjU3/7mTzwY0Q
 36B/aNd1fIT3rc+R/vTaiAzuQyRV9j5ivUN7gZHNePq0h1cXtn1+J0KmTWCoHm0yWP3GELf+iKX
 xMoTQ7T025VU27D58fnpOkpK5/NbFoRcI/cgZCTdSoj8GltdqBdMCHZTCYVlHEcJDwbochTJsR1
 gM/4oWdskssPNLsej1WaXIzzGyKgWCHTA+/uGhPE2fdoe9LIIBFOIDtqKU7w0KELAlphgpch5zR
 rCik217lnhLVfgZNpUg==
X-Proofpoint-GUID: CkkTIizblfPoBPmnelxglOoJfOPaJuT0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2NiBTYWx0ZWRfXzhdhOUNBFzd6
 Tbb9s+hpXXpJPscrwV6kFrq1pB2WohrgAyFkGfj+HukgpqJiBWya63j64J/ln+PDwh/TYgK3XVo
 duPEluHc+jzJoZfpRXYvNBDXwbnAnEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200166
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/13/2026 9:15 AM, Tao Tang wrote:
> Hi all,
> 
> This is v5 of the Secure SMMUv3 series.
> 
> Many thanks to everyone who reviewed the earlier versions. This version contains
> 28 commits in total. Only one patch touches hw/pci (patch #23); the remaining
> patches are confined to the Arm SMMUv3 model. Also some patches in v4 have been
> merged into the mainline QEMU tree, so the v5 series is now smaller than v4.
> 
> Secure Stage 2 is not implemented. Secure STEs which enable Stage 2 are
> rejected with C_BAD_STE. Realm and Root programming interfaces are outside the
> scope of this series.
> 
> Commits layout:
> ---------------
> The commits are roughly grouped as follows:
> 1. (#23, hw/pci only) Add a PCIDevice "sec-sid" property so boards can mark a
>   device's SEC_SID (system integration knob).
> 2. (#1-2, #24-27) Core data-structure and plumbing refactors.
> 3. (#3-8) Introduce SEC_SID through caches, notifiers, and helpers.
> 4. (#9-12) Page table walk related updates (e.g. NSCFG/PTE helpers).
> 5. (#13-15) EVTQ/CMDQ handling and invalidation paths.
> 6. (#16-22) MMIO/register access checks and architectural corner cases.
> 7. (#28) A temporary [NOT-MERGE] commit used with Hafnium to exercise
>   secure-bank register access.
> 
> 
> Main updates:
> -------------
> - (#23, hw/pci only) Add a "sec-sid" property to PCIDevice and consume it from
>   the SMMU in #24 to select the security context and validate capabilities.
> 
>   @Michael: could you please review the hw/pci change
>   ("hw/pci: Add sec-sid property to PCIDevice") and confirm this kind of
>   system-integration property is acceptable for the PCI subtree?
> 
>   For context, I previously posted this as a standalone patch [1]:
>   [1] https://lore.kernel.org/qemu-devel/20251211102729.227376-1-tangtao1634@phytium.com.cn/
> 
>   The commit in this v5 series is an updated version based on Pierrick's
>   feedback (notably switching sec-sid to a string property). We also discussed
>   the need for this knob as a prerequisite for accurately modelling SMMU secure
>   state here [2]:
> 
>   [2] https://lore.kernel.org/qemu-devel/4870b7df-4cb3-457e-9a18-87f3558adf09@linaro.org/
> 
>   We do need a stable way for boards to statically mark devices that may issue
>   Secure transactions.
> 
> other updates:
> - Drop the CR0 and CFGI_CD fixes which are already upstream.
> - Select MemTxAttrs and AddressSpace on demand from SEC_SID and keep the
>   programming-interface namespace in the configuration and IOTLB keys.
> - Route CMDQ, EventQ, IRQ and GERROR handling through the originating
>   programming-interface bank.
> - Tighten MMIO RAZ/WI, writability and reserved-bit handling.
> - Reject unsupported non-NS IOMMU notifier registration.
> - Make secure-impl an on/off/auto property, resolve auto from the Secure
>   AddressSpace, and require Stage 1 support when enabled.
> 
> 
> Testing notes:
> --------------
> - Testing MMIO accesses
>   The branch currently contains one commit explicitly marked [NOT-MERGE]. It is
>   only used to cooperate with Hafnium to exercise and validate secure-bank
>   register read/write paths in a small, reproducible setup as described in [3]:
>   [3] https://hnusdr.github.io/2025/08/09/Test-Secure-SMMU-with-Hafnium-ENG/
> 
>   This commit is not intended for upstream and will be dropped before posting
>   the final mergeable series.
> 
>   For reference, the Hafnium test logs show the SMMU being initialized
>   successfully:
> 
>   INFO: Loading VM id 0x8001: op-tee.
>   INFO: Loaded with 4 vCPUs, entry at 0xe300000.
>   INFO: Hafnium initialisation completed
>

If anyone wants to reproduce it, you can file a precompiled archive
(with optee + hafnium):

$ wget
https://github.com/p-b-o/qemu-linux-stack/releases/download/build/optee-secure-smmu-10674a1.tar.xz
$ tar xvf optee-secure-smmu*
$ ./run.sh ./build/qemu-system-aarch64
 With current master branch:
INFO: Initializing Hafnium (SPMC)
...
ERROR: SMMUv3 does not implement secure state
ERROR: SMMUv3: Failed to initialize driver
Panic: Could not initialize IOMMUs.

With this series applied:
INFO: Initializing Hafnium (SPMC)
...
INFO: Arm SMMUv3 initialized
...
INFO: Loading VM id 0x8001: op-tee.
INFO: Loaded with 4 vCPUs, entry at 0xe300000.
INFO: Hafnium initialisation completed

Tested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Regards,
Pierrick

