Received: by 10.25.159.19 with SMTP id i19csp2243335lfe;
        Mon, 18 Jan 2016 18:49:17 -0800 (PST)
X-Received: by 10.55.72.87 with SMTP id v84mr36314123qka.9.1453171757664;
        Mon, 18 Jan 2016 18:49:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c18si34694843qkb.8.2016.01.18.18.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 18:49:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLMM9-0001Fv-7w
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 21:49:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aLMM7-0001Fl-37
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 21:49:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aLMM1-0004rs-LV
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 21:49:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43574)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1aLMM1-0004ro-Fq; Mon, 18 Jan 2016 21:49:09 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id CFB137AEB4;
	Tue, 19 Jan 2016 02:49:08 +0000 (UTC)
Received: from [10.72.5.45] (vpn1-5-45.pek2.redhat.com [10.72.5.45])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0J2mwPP003554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Jan 2016 21:49:02 -0500
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<569C8B29.4040300@redhat.com>
	<CAPokK=ovLXz__Tbh--dB+GEFpgBK8w3erG=P2jNrKbY37eJWyg@mail.gmail.com>
	<569C9E87.2030001@redhat.com>
	<CAPokK=qhk15US4a-OHLFo=U2GReQv45dT4oL6z=Hu0m8Bkf74Q@mail.gmail.com>
	<569CB702.1060803@redhat.com>
	<CAFEAcA9DZ6OhN=cXVrbZftazX9eJb1eKRLG2D+Vp6mYnoXP60g@mail.gmail.com>
	<CAKmqyKMFsFa81bsauLfsB7UP1dSdboGgn=8vaN+-nnShuG5CMQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <569DA419.3030601@redhat.com>
Date: Tue, 19 Jan 2016 10:48:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMFsFa81bsauLfsB7UP1dSdboGgn=8vaN+-nnShuG5CMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Prasad Pandit <ppandit@redhat.com>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?5YiY5Luk?= <liuling-it@360.cn>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] cadence_gem: fix buffer overflow
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: akLhKuvh52zx



On 01/19/2016 12:54 AM, Alistair Francis wrote:
> On Mon, Jan 18, 2016 at 2:06 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 18 January 2016 at 09:57, Jason Wang <jasowang@redhat.com> wrote:
>>> Thanks for the pointer.
>>>
>>> In section 16.1.5, it said
>>>
>>> "Jumbo frames are not supported."
>>>
>>> So it was in fact not an unimplemented feature?
> I'd say this should be a guest error then. Unless anyone who knows
> Ethernet well thinks otherwise?
>
> Thanks,
>
> Alistair

Yes, agree.

>
>> I have a vague feeling from the last time I looked at something like
>> this that what often happens is the hardware happily goes on dumping
>> data out on the wire but this is a violation of the ethernet protocol,
>> ie a guest error. But I'm no ethernet expert...
>>
>> thanks
>> -- PMM
>>

