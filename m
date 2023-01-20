Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1118255ejc;
        Fri, 20 Jan 2023 06:26:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsph8zkupK1qJxpZ7gASiqiDamEItaLx3iuqyBjVt3ElWfL9skIZaiNP4YP2kocF/Ri2Olf
X-Received: by 2002:a05:6214:21a8:b0:534:2099:5df9 with SMTP id t8-20020a05621421a800b0053420995df9mr29005575qvc.20.1674224782377;
        Fri, 20 Jan 2023 06:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674224782; cv=none;
        d=google.com; s=arc-20160816;
        b=ruj38UBctToKI0g6gBTPR+ucaFw/xZUqxSeHH85KqlMSz3EbUCh9v/H8ajjbI/4Y1/
         +yYX8XxDDJvi+fuhUhUwmPgJTCYvQBrbF7VWI0SOtK9XtZrD6M0wYWyl6xarEK/6NSaS
         0CmHcsyGt1lat/g9NgdbQx3tMJYFs6dg+kHumEzwwouMhXmk2FWj5Qlh93HaLmTWJ0wr
         DQ2LreFuR4yweutGh/0wDAhRzFJP3286uB6+BPeem/mU2ca23Xdm8PJzF1vA24t0v0I1
         HAL7ohCB7G/9noNiyjDEJr754cbGsAeuOK9XRyGkL62LoYVpI9QE5W1HbXA9Y8gJZuoU
         ++dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=KBy3ZQLGQHh/vTDyBwwa0pU/PwW9dIIX84zu//Y4tjM=;
        b=FR0SJ6smP0wNWfNx8iTvIxeBOUEyX0WWKD6OQ5YgQ/O6FUOxx4L/9Lqd+WcYgz+fX2
         D0+ZlXsJxliPrgzQkAnZMFz+as7CIxM6MWlt8WZja76LcN1zqWz7ncrxBPxpoJQJmf+P
         EqU7NBAjzSlZ6qW7yVEv9fo2MkUoRsHe43dOsPgj3CZ1x30L3HH6R6lZN8Z59TjfLOnW
         8xPEHlA5GnDHUw3iwC1VEfJCY13lxn7TVxc0+gcoNn15GPtOjpzBpTkT+JTiJq1yr/Uy
         aNxUIUsVgV3Z9JDk8TvLblKW71Tqmq+y6Xd0Q2WMOxNNCc24RzvqR3xogkvs8AWERzYk
         mKPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf3-20020a056214250300b004ef59b08961si25335140qvb.536.2023.01.20.06.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 06:26:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIsLJ-0001lD-Mm; Fri, 20 Jan 2023 09:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pIsLG-0001hP-OM; Fri, 20 Jan 2023 09:26:07 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pIsLB-0006vQ-WC; Fri, 20 Jan 2023 09:26:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 157962AD31;
 Fri, 20 Jan 2023 14:25:56 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 20 Jan
 2023 15:25:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0047f0e0811-9d9b-4b40-80b5-400d064d373e,
 B144956C13BBC382596DA5742790BEAB579A3E91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2d35012a-d493-83d7-843c-fdcee387e63f@kaod.org>
Date: Fri, 20 Jan 2023 15:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/2] tests/avocado: Factor file_truncate() helper out
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Beraldo Leal <bleal@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Subbaraya Sundeep
 <sundeep.lkml@gmail.com>
References: <20230120134314.81956-1-philmd@linaro.org>
 <20230120134314.81956-2-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230120134314.81956-2-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: eb36aae7-08d5-4326-b3f5-8bac4bd7e5d1
X-Ovh-Tracer-Id: 11849815047274531692
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpsghlvggrlhesrhgvughhrghtrdgtohhmpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhsuhhnuggvvghprdhlkhhmlhesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpe
 hsmhhtphhouhht
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 84vFo/cOO53Z

On 1/20/23 14:43, Philippe Mathieu-Daudé wrote:
> Factor file_truncate() helper out of image_pow2ceil_expand()
> for reuse.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 8c1d981586..8a598be966 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -30,15 +30,16 @@
>   def pow2ceil(x):
>       return 1 if x == 0 else 2**(x - 1).bit_length()
>   
> +def file_truncate(path, size):
> +    if size != os.path.getsize(path):
> +        with open(path, 'ab+') as fd:
> +            fd.truncate(size)
> +
>   """
>   Expand file size to next power of 2
>   """
> -def image_pow2ceil_expand(path):
> -        size = os.path.getsize(path)
> -        size_aligned = pow2ceil(size)
> -        if size != size_aligned:
> -            with open(path, 'ab+') as fd:
> -                fd.truncate(size_aligned)
> +def image_pow2ceil_expand(path, size):

The image_pow2ceil_expand() callers should be changed to add 'size' argument.

C.


> +    file_truncate(path, pow2ceil(size))
>   
>   class LinuxKernelTest(QemuSystemTest):
>       KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '

