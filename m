Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED7CC531D0
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 04:11:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpI6g-0008NY-DI; Thu, 30 Jul 2026 00:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpI6e-0008Mk-Fp
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 00:10:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpI6c-0005xR-DM
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 00:10:52 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66U42UKZ3878500
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 04:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iEQnpL0SLxhlc/8M0ysD4UW+4ULcZ7Q5udeaJLtbom8=; b=dV6SLl15f61TEPhS
 eib9ptj52+g7jAVrkTG8zk557c2i1U6rbUMojEzbiFsejXfg5lSbU9jMb9Pr56z0
 J8YzLdOx98+0SOs3wBVYUBJt9gIiMNnGJ6S6mui+dP8byYCX5hLRqOkxU/bVf404
 U3O7U/JC4cG3iwE1voS5MuHt/Zl3uy7/dyxPSlNoOkyBEApwlqC7h5fRVTBYj8qR
 SNXdyTMuxoVnBkr8+aBxb6qzo2S+ZCD/x15IqGfChw6QviiK5tv2CqQDstcOG9s9
 KLVnzLbEuWNMDxZFV6G2+qtQ3ArwSuQccYZPwViYkwCJgy2Iv8KFjJ60kBtgxosp
 gYqUJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqy8380y9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 04:10:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92ac0a54110so206775485a.2
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 21:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785384648; x=1785989448; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iEQnpL0SLxhlc/8M0ysD4UW+4ULcZ7Q5udeaJLtbom8=;
 b=el36tCX2lDZYPbx0zVDvbWF86FNmGOU8FV0tsu0O51Nbwf9zN9kj2QZjm7248zax8Q
 +4d8wx/Aser7sGTgv3EIrQyaSKZHPyoCyTLS+uX8ioifLvyl3vn6ZgOjauQYJruxvzpV
 iQf3QLw5e7UyiNwxxD3pD8GonMyzJ7FAzYG/b+oVX+BfXQmhybrBL8hwen5xicOyMg6a
 LK4Z1F2EddsSpGvz02iEiWF6Ddgc65m/jYWfwwyc/gKjzXik1feEEmRjxLMZXvBki2TV
 SunsyH2BjqHnCnVX+tDiHeDWNAO0pzSVNEsM6iXtcgd8mwsRJXe+x3qkDcELGoufUxU3
 Yh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785384648; x=1785989448;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iEQnpL0SLxhlc/8M0ysD4UW+4ULcZ7Q5udeaJLtbom8=;
 b=sbHWN0WSGCoG7PnEA2f1Xht+iyD2p/p9wLvKZNo6wMYybICmUDapVvBkTKNjZ1vRU+
 D8gz+Yz51Zdm+USfj4M2G4tcS3LFVlJztEWvJpp6vqoIC/+9KO6QdHxwHPxBUS0tDyNZ
 zajOzWuVsUh+GCqX1sCBuo5lLm7pBgfHMMQStOia4NneQsBMkIGn7d9OVyzl+fTOrDhr
 +rRJLEWNksaxQBm0572YSCEl+sO8xnMSYZRV9S6oD0tqeqs+4GIY+yN66ovgqwLQVEZj
 Vftj+svQGsJcw4HAIEc+DjTWMzxYpks1EPg9s3UGHCWs9P7yAEbE7adqoFa8rOp2jtai
 R/0A==
X-Gm-Message-State: AOJu0YzPEbY4HKigY9FGMPalbXM0IZODFZ60E2jRqGBzeMcOM1/wytM7
 Oa82evZg7lP/eD3Qhfvk/ESJNTvv+ya6R2SwJLPEx5882w6OSelmsHzq+dRCOyng1rFUGJMBdMI
 exgTwAFsEPKAh/4vgLUTLLeVfhp+v5ay2aZImNS1Nqx1uTLZ7d/3dWt8=
X-Gm-Gg: AR+sD10vp4C80jWfStI0fHS0N61oCbrg1XnthjwycqXnBGMeD8QRdpLP3pgeaQOjNUi
 GTQYDx7zqdE0P9R5xI+BPqkDjs7E0W99m4P485AJ/SpOXlyCY9j10+rOjoDvhdrz1BAbQvhT1CZ
 Ii+Ei84x7jhee66zzzxBwanEwOzJU+unFTdri0y0I7vSBjqxHZ8LcVmqZ4CZa37VITkx30txuhC
 RBww4tMtrBKpMLh0Ld30yTqqKIt62clTTyxZupgxeaFRz7nDD00W5QVxdAoNHsF30dSYvBTaivj
 GjV0etwLHg6ZuE08/7mwQIYSY3uCYbjg18JlIcDzKRzTgd0bpStZIC9hkDGvOk1U7L/49vM+gBN
 OmhuAhMkOGTKXhq2ftysvGPwtQIvGOTPx+HRpOf0CB7FYAu4uVm0=
X-Received: by 2002:ac8:6108:0:b0:51c:7b12:6002 with SMTP id
 d75a77b69052e-52b386fd84bmr11447951cf.78.1785384648171; 
 Wed, 29 Jul 2026 21:10:48 -0700 (PDT)
X-Received: by 2002:ac8:6108:0:b0:51c:7b12:6002 with SMTP id
 d75a77b69052e-52b386fd84bmr11447671cf.78.1785384647695; 
 Wed, 29 Jul 2026 21:10:47 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49800f0ecd4sm22054265e9.1.2026.07.29.21.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 21:10:46 -0700 (PDT)
Message-ID: <08f1a327-b5a4-45a3-ae60-ba506dc44c5b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 06:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] accel: Add Nitro Enclaves accelerator
Content-Language: en-US
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 berrange@redhat.com, marcandre.lureau@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, mst@redhat.com,
 Dorjoy Chowdhury <dorjoychy111@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Tyler Fanelli <tfanelli@redhat.com>, mknaust@amazon.com,
 nh-open-source@amazon.com
References: <20260225220807.33092-1-graf@amazon.com>
 <20260225220807.33092-5-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260225220807.33092-5-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NRB1pG1nhTiAYb3TqFO5ADorg5BW5fLg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAyMyBTYWx0ZWRfX+2PKvJlaaR3F
 FycGjdysscRxqHAuMFCycMffc8sZPsmAVMqZ9uJm2nGGaqThBmhUljvbWkZQoyWzyOUAKAlZMSf
 7PwaQm7KDaLyZcF5/AUQ6w5OnB8YBue9+K9GMkdtFYOMGhkCtASGxa8tRvQ5wGuc1T+gqejolBf
 5shzinM+6w9fTGuY/k7co4tliSRetAJ5BFUgIg+bvF+XpUJkT28m8keXzcIFwJp7Ebd8X+EKbDf
 d6LORSB8ylW3uwOE/79DBKVVGhr5FsdBnF3sR7CB9+fLjU92CHvOpC9d881yI0h0KiDd6Yyre2R
 n1PowZDUHqg5auKE2WfWFGSFHb/a0IHFp7LjLmS+MLzOU1mT2T8WKX5ellA3ZJNqddaGwps7HLK
 /fHoUMTRZ28cdmPSN6hX2vaINVF8yp1EiSPhyQAnNc2BHaSX5zoEAjkqfPTqa5zPXmVnNzJaC54
 JUCWpWixw95O+5LqMwA==
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a6acec8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=vggBfdFIAAAA:8 a=Lts1TZ1OJREuB4Zr8voA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NRB1pG1nhTiAYb3TqFO5ADorg5BW5fLg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAyMyBTYWx0ZWRfX4sLziPPGNg2U
 7yKihZwY9ROxswYGVY2kPEp5ZCZ7oRk4qEu4p8mqtzlPOKFp76r8uiZ0j/TC43XigW9vlbQoDM4
 frn6uSjNRfEsiDyBEy6+XOJSdgzf7HU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300023
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Hi Alex,

(now committed as 8155bca60d436e6422ee08be3b93c952540e45da)

On 25/2/26 23:07, Alexander Graf wrote:
> Nitro Enclaves are a confidential compute technology which
> allows a parent instance to carve out resources from itself
> and spawn a confidential sibling VM next to itself. Similar
> to other confidential compute solutions, this sibling is
> controlled by an underlying vmm, but still has a higher level
> vmm (QEMU) to implement some of its I/O functionality and
> lifecycle.
> 
> Add an accelerator to drive this interface. In combination with
> follow-on patches to enhance the Nitro Enclaves machine model, this
> will allow users to run a Nitro Enclave using QEMU.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> 
> ---
> 
> v1 -> v2:
> 
>    - Use dummy, move cpu init to post
>    - Trigger nitro-vsock-bridge instead of QOM properties
> 
> v2 -> v3:
> 
>    - Mark as no reboot
> ---
>   MAINTAINERS                   |   6 +
>   accel/Kconfig                 |   3 +
>   accel/meson.build             |   1 +
>   accel/nitro/meson.build       |   3 +
>   accel/nitro/nitro-accel.c     | 284 ++++++++++++++++++++++++++++++++++
>   accel/nitro/trace-events      |   6 +
>   accel/nitro/trace.h           |   2 +
>   accel/stubs/meson.build       |   1 +
>   accel/stubs/nitro-stub.c      |  11 ++
>   include/system/hw_accel.h     |   1 +
>   include/system/nitro-accel.h  |  25 +++
>   meson.build                   |  11 ++
>   meson_options.txt             |   2 +
>   qemu-options.hx               |   8 +-
>   scripts/meson-buildoptions.sh |   3 +
>   15 files changed, 363 insertions(+), 4 deletions(-)
>   create mode 100644 accel/nitro/meson.build
>   create mode 100644 accel/nitro/nitro-accel.c
>   create mode 100644 accel/nitro/trace-events
>   create mode 100644 accel/nitro/trace.h
>   create mode 100644 accel/stubs/nitro-stub.c
>   create mode 100644 include/system/nitro-accel.h


> diff --git a/include/system/hw_accel.h b/include/system/hw_accel.h
> index 628a50e066..f0c10b6d80 100644
> --- a/include/system/hw_accel.h
> +++ b/include/system/hw_accel.h
> @@ -17,6 +17,7 @@
>   #include "system/mshv.h"
>   #include "system/whpx.h"
>   #include "system/nvmm.h"
> +#include "system/nitro-accel.h"
>   
>   /**
>    * cpu_synchronize_state:

Is this line deliberately missing?

-- >8 --
diff --git a/include/system/hw_accel.h b/include/system/hw_accel.h
index f0c10b6d805..68716b2cfc6 100644
--- a/include/system/hw_accel.h
+++ b/include/system/hw_accel.h
@@ -50,6 +50,7 @@ static inline bool hwaccel_enabled(void)
  {
      return hvf_enabled()
          || kvm_enabled()
+        || nitro_enabled()
          || nvmm_enabled()
          || whpx_enabled();
  }
---

> diff --git a/include/system/nitro-accel.h b/include/system/nitro-accel.h
> new file mode 100644
> index 0000000000..a93aa6fb00
> --- /dev/null
> +++ b/include/system/nitro-accel.h
> @@ -0,0 +1,25 @@
> +/*
> + * Nitro Enclaves accelerator - public interface
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef SYSTEM_NITRO_ACCEL_H
> +#define SYSTEM_NITRO_ACCEL_H
> +
> +#include "qemu/accel.h"
> +
> +extern bool nitro_allowed;
> +
> +static inline bool nitro_enabled(void)
> +{
> +    return nitro_allowed;
> +}
> +
> +#define TYPE_NITRO_ACCEL ACCEL_CLASS_NAME("nitro")
> +
> +typedef struct NitroAccelState NitroAccelState;
> +DECLARE_INSTANCE_CHECKER(NitroAccelState, NITRO_ACCEL,
> +                         TYPE_NITRO_ACCEL)
> +
> +#endif /* SYSTEM_NITRO_ACCEL_H */

