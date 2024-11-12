Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7345672njc;
        Tue, 12 Nov 2024 05:58:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWU88u+jiMu7EDYC9cNyghMfoY+pmpP+CNIfvBFV/66FW+aVX8AKdno/V7r3m/PB+0CSglEubhSFO3Xng==@linaro.org
X-Google-Smtp-Source: AGHT+IFdDohZMmwctOSS26NSj9UC9tnMxb/jfFqRJ248OYxJg0E59Wqrax+w8IByssCt9EJOo/K3
X-Received: by 2002:a05:620a:3915:b0:7b1:462f:46f7 with SMTP id af79cd13be357-7b331ebf219mr2312445985a.30.1731419920443;
        Tue, 12 Nov 2024 05:58:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731419920; cv=none;
        d=google.com; s=arc-20240605;
        b=A4asE1DRrDKFq1KRP0BeraHO+w7zB3IfVHReTK3SpD+9yrApompOp4Sk87QL1kV6WX
         wgoO0TkbC59BqoG14KSF9fvwC3taIMusPLKORA7HlJkRbbknapfJ5mRZyUMCNu8mKPx0
         zejk0+YQg3307d/hfC1VZ7sU0QbzJ3Er8g8Ac7ZRpifCHNc30Ix5rxgpnIQnczeVQ5v5
         HMH0Y2yNSFnVB7VBn0bV45/BWoJBM9+lkKYJJAaAgr1FxCArjgBQ2A17DAxbkqgrJupr
         leb9T9J/+Yt9U7jjBxtXy7hEAmFvYhpOwS34whJlcDbWQPysHCtHTQ5xt9l5W9uyQ9ig
         35RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=hdXVUlqVfoMx7VfsEYkygPSm+aQDbnjz4m29Ey7ggq4=;
        fh=KgzYI+6Q91k+NerbIyXKyNcdEwKkzIhfMCWjhA79F1Y=;
        b=IQj9/NbdojPEV3ZKej2j0MOz9rdUvHKDEArhYtz/Ddnd4G9ZdWRAtvZlCE2PkO4kI4
         M+aC7RKeaDgR+6qzG+Z49UpeuHikqNemG+5g1RXLtiWj1Mfl2Mb+jJO/lKhiItEA7E4i
         vaGj6uGvREGFDt0BIlbPxbGOi5bxrNzi3Rqxhi2cTacCSrYRDpru081wFzdVD/lhLdSN
         ydDCP8TU0Jcu5f2w+VUjGdEQHTsQHhc1FJfCWmWiVCXMOJJYOLOwADOiFS2GYGXcWFpm
         YpgmlgWiD/NPuFR1bMhj6SiPFpQh15rMJcxQa9e9ouzsZWbyU3UdpXaJRCducoEmBV5l
         RyDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZdX3hpeO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ace4fbcsi1353250485a.396.2024.11.12.05.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 05:58:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZdX3hpeO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tArPd-0005Qh-Lz; Tue, 12 Nov 2024 08:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tArPb-0005OV-HA
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:58:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tArPZ-0003wX-Mx
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731419908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hdXVUlqVfoMx7VfsEYkygPSm+aQDbnjz4m29Ey7ggq4=;
 b=ZdX3hpeOfhAYnBgo7AWw63wLPwmrpQS+8bjUfUmdN5EudUcX6ONF/brrmV8MigsBkrmZBs
 KzaZ124GG9q4bmwM4ktwcI8NJXG9LtfARNbR3kypYEwEWEK0QVbWT41UNNJkdtEeMXkkZ5
 +lPjmRT12a22h3DQrHddy8zSrzlTsvA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-6vxhtvoLN8-ZbUzi5xtc_g-1; Tue, 12 Nov 2024 08:58:27 -0500
X-MC-Unique: 6vxhtvoLN8-ZbUzi5xtc_g-1
X-Mimecast-MFC-AGG-ID: 6vxhtvoLN8-ZbUzi5xtc_g
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-460b638b668so103053541cf.0
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 05:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731419907; x=1732024707;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hdXVUlqVfoMx7VfsEYkygPSm+aQDbnjz4m29Ey7ggq4=;
 b=wjoGa6ErT37Q/1CVwUL2MbCVFGsg1AT+mUooTfAOh2Q70ufefrli4Bu/OcGoSREdHB
 qUP3SpX0dgrEOXIrxR23zvLRm0RM208+pp0ScXRKjgb5Msg3jT3VC2CpG22d/zi/xas9
 WxC+e0TlxrOWIi/7uTEITvHP5T+WHzHiYINwA3rPYJwOUa1hNFG+rX60zyGvVzzOc43j
 Grk11SGlNQA9lOAXdGfo2Zjm9Dcw3TuqdNL8OJFFL8mbLsYOhcL8RTzOQrHhEGIVHydr
 obvt89Qtny64sKxV4blCxDh2wmVICk3dnSkxfdaAJdjFY63k1qTaSWs+kJuk4erdqt3E
 6Wvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVonJGE7B9Xuq0DOmlZEr0q/cbct/Np8Z3FbKh3MMAZ99A1fuDWETJ02mXUt3zvtS5eP2IfiKP7jQ==@nongnu.org
X-Gm-Message-State: AOJu0YyPqdo2FqXe5tkb6/yvXdDzwri7IfL0q6IlnMUOUo8CT24/81sp
 RI4XEcu1jt9wDEHXj09e7m9CLlWCcy21u4xoTe+7bjOHbNoUvic/HjxvskljDH/9ovQrMpPY7f9
 HaoSNjZ+6qGugIv53HCfMjP3UcR6kGPw+qrg5+1a0pn9JR6T2Eg==
X-Received: by 2002:a05:622a:207:b0:458:34fb:5d59 with SMTP id
 d75a77b69052e-4630938ab07mr211818331cf.29.1731419907164; 
 Tue, 12 Nov 2024 05:58:27 -0800 (PST)
X-Received: by 2002:a05:622a:207:b0:458:34fb:5d59 with SMTP id
 d75a77b69052e-4630938ab07mr211818151cf.29.1731419906904; 
 Tue, 12 Nov 2024 05:58:26 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-49-115.web.vodafone.de.
 [109.42.49.115]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-462ff5c8eb1sm75096471cf.77.2024.11.12.05.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 05:58:26 -0800 (PST)
Message-ID: <2fce3b45-d234-4fa8-93fa-2fa312203ef1@redhat.com>
Date: Tue, 12 Nov 2024 14:58:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] tests/functional: Convert Aspeed arm SDK tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241112130246.970281-1-clg@redhat.com>
 <20241112130246.970281-4-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <20241112130246.970281-4-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _pJAX0EIXApdh_qttEMkAkpBb9C6gL6Fqqkgmc4simY_1731419907
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.671,
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
X-TUID: Pi9QHXrnQFu3

On 12/11/2024 14.02, Cédric Le Goater wrote:
> Drop the SSH connection which was introduced in the avocado tests to
> workaround read issues when interacting with console.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/avocado/machine_aspeed.py     | 124 ----------------------------
>   tests/functional/test_arm_aspeed.py |  67 +++++++++++++++
>   2 files changed, 67 insertions(+), 124 deletions(-)
>   delete mode 100644 tests/avocado/machine_aspeed.py
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> deleted file mode 100644
> index 2240c82abff9..000000000000
> --- a/tests/avocado/machine_aspeed.py
> +++ /dev/null
> @@ -1,124 +0,0 @@
> -# Functional test that boots the ASPEED SoCs with firmware
> -#
> -# Copyright (C) 2022 ASPEED Technology Inc
> -#
> -# This work is licensed under the terms of the GNU GPL, version 2 or
> -# later.  See the COPYING file in the top-level directory.
> -
> -import time
> -import os
> -import tempfile
> -import subprocess
> -
> -from avocado_qemu import LinuxSSHMixIn
> -from avocado_qemu import QemuSystemTest
> -from avocado_qemu import wait_for_console_pattern
> -from avocado_qemu import exec_command
> -from avocado_qemu import exec_command_and_wait_for_pattern
> -from avocado_qemu import interrupt_interactive_console_until_pattern
> -from avocado_qemu import has_cmd
> -from avocado.utils import archive
> -from avocado import skipUnless
> -
> -class AST2x00MachineSDK(QemuSystemTest, LinuxSSHMixIn):
> -
> -    EXTRA_BOOTARGS = (
> -        'quiet '
> -        'systemd.mask=org.openbmc.HostIpmi.service '
> -        'systemd.mask=xyz.openbmc_project.Chassis.Control.Power@0.service '
> -        'systemd.mask=modprobe@fuse.service '
> -        'systemd.mask=rngd.service '
> -        'systemd.mask=obmc-console@ttyS2.service '
> -    )

What about that EXTRA_BOOTARGS stuff? Is it not required/wanted in the new 
file anymore? ... maybe mention it at least in the commit description?

  Thomas

