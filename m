Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp15442013lff;
        Mon, 30 Dec 2019 05:56:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqxLjgtV7R/0a857eEcmSdS7p84lKFcBlqIDKHuxmbjlF3qh6UFrIBbXtamcS/reGrrGGv67
X-Received: by 2002:a37:9ac5:: with SMTP id c188mr53827370qke.374.1577714178218;
        Mon, 30 Dec 2019 05:56:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577714178; cv=none;
        d=google.com; s=arc-20160816;
        b=kmPhd+vbVeX9HCKjSxTMd2aSTfnun6dZdl+ER71+aMZD2d5VVJYjBQb+G+x83L0ebu
         1RqrlZY9i8UcvT70X676nnrVjXHlVF41upjEIxeQELhhJit5odNbIBl85K6X9xwQp8Et
         JlUs4aF8TA+fs7br1BJN8HubHIH4SdKftymR2gUXzZXtSUrV4/6ZKdh1jqKJsyCJWa9x
         hZxf3jMrw4Io9u6VsYeJHj3MD3ec83noe59t5/glH40z26APS6vpQ0kjpWlGqlr07Tp9
         3nHpM6pNrox5b87Z/2kDKRRLVtKQl8SYji1ZHADDt8XbeJIC6tgC25kUWwRbi0KGhJwz
         IPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3MHSzmjz6cu9SKrzfWd1SEiu5xFqOAFfwFjdZyZ6OEQ=;
        b=b6QgUZ1/v0M/GyWB6QeFe11uSpyHR4RLAQK8qVszS8bzu1vaoE7wVAZlJ1UYNSIuP4
         uGD2Z+3UM9CiOQboJ/wAt0mTxTja4gvyeCyJvJnH8aDvYKhba1s4UhN59QlUdon4Iz9c
         YIIx1LhrlkeV6WeFQzM4dV0BVXHHlk2GTLqmJjmn1RmEd47l35Ypj6gWWbydEowjPUI0
         Y7z6nhFjzU53oycFizKCAVTJ2MQduY2WXLdEsMBkbDGUyalTREMpZjW9N665xsWqWeJC
         bgGTvgxsVy1VuamTshIUd6qf1F4BzCt6NPnNwaAnbk1x5fqTsyPbPHM1BQS3C33q6PSe
         3Vxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ISAzgv8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si19324012qka.271.2019.12.30.05.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 05:56:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ISAzgv8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ilvWr-00008U-HS
	for alex.bennee@linaro.org; Mon, 30 Dec 2019 08:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55308)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilvWg-00006d-JB
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 08:56:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilvWf-0003Lf-DB
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 08:56:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40671
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilvWf-0003KV-8z
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 08:56:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577714164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3MHSzmjz6cu9SKrzfWd1SEiu5xFqOAFfwFjdZyZ6OEQ=;
 b=ISAzgv8twtjSxsRoEuZ7VH/W0RP1RM7xgKpjX0D6Ol66UKbgaQm/RNmv+VHA4iGeezHVTK
 evxyXC2YjWb7YXMZn/ASTmLXa2OWT6UBcJEJhy7rKVrx9iUOl0Cz5TYZK389BoouRgJB5J
 BuVUCw+w+tKad/9GmLhIchM/cgN9AVk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-wqi4qTYnPdesnLpOViH-Dw-1; Mon, 30 Dec 2019 08:56:01 -0500
Received: by mail-wr1-f69.google.com with SMTP id f15so3373944wrr.2
 for <qemu-arm@nongnu.org>; Mon, 30 Dec 2019 05:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3MHSzmjz6cu9SKrzfWd1SEiu5xFqOAFfwFjdZyZ6OEQ=;
 b=NdDUoq1Ul0Og+gNsL4mZdJSKqd8R0/O9RQyI7q//hscilS1mVK5byX5PesGZyQm54z
 yBKzn52eBAVBNG13OmWHA8boWY/yIsXkdJJMEGW8oXP9dtxA0h1IFPSlb2ZzAGhrA11C
 r7lem1dZuW7vlKDd0kpdMupmMF3XWeJWAnB2co+BPDBL3KvUIziOCeDdLYVX0wbLgV8Z
 mpRvnMzza1ttjXayhn7pIlAKUwfqIQEDplprh3EFN3MG3gnXbJl9yqF/tv3i9yJarUle
 9xkcqGsECFY1deIKMrEUkIfQCXQ9iX+6ndmqePlV9K9j8+lKnNqS7b84wjMbHyvFIoy3
 IjqQ==
X-Gm-Message-State: APjAAAXTOGjCm2H8EpEQwunx36t2Et6NfVJVX7qij08niigFi329z4Gr
 W0kbBablfr50KKbiBKFsJAIgMQnSuc+ciMuxN3gr2Tl3kKWmjgnpapzxaWRpmDuuKkDSoPmDBuy
 27KJOKWrq2V7u
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr63088132wrr.215.1577714160005; 
 Mon, 30 Dec 2019 05:56:00 -0800 (PST)
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr63088109wrr.215.1577714159747; 
 Mon, 30 Dec 2019 05:55:59 -0800 (PST)
Received: from [192.168.1.25] (abayonne-654-1-186-92.w92-134.abo.wanadoo.fr.
 [92.134.161.92])
 by smtp.gmail.com with ESMTPSA id b15sm20694410wmj.13.2019.12.30.05.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 05:55:58 -0800 (PST)
Subject: Re: [RFC PATCH 6/6] hw/arm/cubieboard: Disable unsupported M-USB in
 device tree blob
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20191230110953.25496-1-f4bug@amsat.org>
 <20191230110953.25496-7-f4bug@amsat.org>
 <CAPan3WrBN77rcczzQ1knMEKCaCUSCb6RtdhSMiDWE9Ah7jvgjg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9cdbe625-fe29-cb91-2ed4-1231953b3148@redhat.com>
Date: Mon, 30 Dec 2019 14:55:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3WrBN77rcczzQ1knMEKCaCUSCb6RtdhSMiDWE9Ah7jvgjg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: wqi4qTYnPdesnLpOViH-Dw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vl6NvqoUnGop

On 12/30/19 12:33 PM, Niek Linnenbank wrote:
> Hello Philippe,
> 
> I have a suggestion: probably you can apply (almost) the same patch to 
> get USB
> working for A10 as I did in the Allwinner H3, in patch #4 "add USB host 
> controller" [1]
> That way you can avoid the DTB modifications and with low effort get USB 
> working as well for this board.
> As far as I can see, in Section 21.1 in the A10 user manual [2] has the 
> same description
> as for the H3. It basically has the standard EHCI and OHCI interfaces.

Oh good news. I guess in the long term we want a AllwinnerSoc parent 
class where all common blocks are mapped, and A10/H3 children with the 
differences. But we'll worry about that after your H3 series get merged.

> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg03266.html
> [2] https://linux-sunxi.org/File:Allwinner_A10_User_manual_V1.5.pdf
> 
> Regards,
> Niek

