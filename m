Received: by 10.182.105.169 with SMTP id gn9csp273568obb;
        Wed, 28 Oct 2015 20:51:58 -0700 (PDT)
X-Received: by 10.66.102.101 with SMTP id fn5mr37420961pab.111.1446090718440;
        Wed, 28 Oct 2015 20:51:58 -0700 (PDT)
Return-Path: <zhaoshenglong@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com. [58.251.152.64])
        by mx.google.com with ESMTPS id ea2si75212852pbc.135.2015.10.28.20.51.57
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Wed, 28 Oct 2015 20:51:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhaoshenglong@huawei.com designates 58.251.152.64 as permitted sender) client-ip=58.251.152.64;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of zhaoshenglong@huawei.com designates 58.251.152.64 as permitted sender) smtp.mailfrom=zhaoshenglong@huawei.com
Received: from 172.24.1.49 (EHLO szxeml426-hub.china.huawei.com) ([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CYA80740;
	Thu, 29 Oct 2015 11:51:52 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml426-hub.china.huawei.com
 (10.82.67.181) with Microsoft SMTP Server id 14.3.235.1; Thu, 29 Oct 2015
 11:51:48 +0800
Message-ID: <563197D3.5050206@huawei.com>
Date: Thu, 29 Oct 2015 11:51:47 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Peter Maydell
	<peter.maydell@linaro.org>
CC: Paolo Bonzini <pbonzini@redhat.com>,
        Peter Crosthwaite
	<crosthwaitepeter@gmail.com>,
        =?ISO-8859-1?Q?Alex_Benn=E9e?=
	<alex.bennee@linaro.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] proposal: new qemu-arm mailing list
References: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com> <20151027110233.GE18847@toto>
In-Reply-To: <20151027110233.GE18847@toto>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-TUID: tTnluvuLxh8l



On 2015/10/27 19:02, Edgar E. Iglesias wrote:
> On Tue, Oct 27, 2015 at 10:15:32AM +0000, Peter Maydell wrote:
>> Hi; it's been suggested to me that it would be helpful to have a
>> qemu-arm mailing list, along the lines of the existing qemu-ppc
>> and qemu-block lists. The idea would be to get people to cc the
>> list with their ARM related patches, so it would mostly act as
>> a way for people to filter their mail to separate the ARM stuff
>> out from the qemu-devel firehose. (Everything should still be
>> cc'd to qemu-devel as well.)
>>
>> Any objections/opinions?
>>
> 
> Sounds good to me!
> 
+1

-- 
Shannon
