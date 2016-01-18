Received: by 10.25.159.19 with SMTP id i19csp1816132lfe;
        Mon, 18 Jan 2016 01:57:44 -0800 (PST)
X-Received: by 10.140.159.194 with SMTP id f185mr31406946qhf.72.1453111063989;
        Mon, 18 Jan 2016 01:57:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e110si30230909qge.8.2016.01.18.01.57.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 01:57:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58559 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL6ZD-0000rW-KY
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 04:57:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aL6ZA-0000qi-CM
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 04:57:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aL6Z7-0004FR-7K
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 04:57:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1aL6Z7-0004FN-1Y; Mon, 18 Jan 2016 04:57:37 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id ECF93C09FABC;
	Mon, 18 Jan 2016 09:57:35 +0000 (UTC)
Received: from [10.72.5.6] (vpn1-5-6.pek2.redhat.com [10.72.5.6])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0I9vNu7003740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Jan 2016 04:57:28 -0500
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<569C8B29.4040300@redhat.com>
	<CAPokK=ovLXz__Tbh--dB+GEFpgBK8w3erG=P2jNrKbY37eJWyg@mail.gmail.com>
	<569C9E87.2030001@redhat.com>
	<CAPokK=qhk15US4a-OHLFo=U2GReQv45dT4oL6z=Hu0m8Bkf74Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <569CB702.1060803@redhat.com>
Date: Mon, 18 Jan 2016 17:57:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAPokK=qhk15US4a-OHLFo=U2GReQv45dT4oL6z=Hu0m8Bkf74Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Prasad Pandit <ppandit@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?5YiY5Luk?= <liuling-it@360.cn>
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
X-TUID: GeDf2P6oWD4g



On 01/18/2016 05:08 PM, Peter Crosthwaite wrote:
> On Mon, Jan 18, 2016 at 12:12 AM, Jason Wang <jasowang@redhat.com> wrot=
e:
>>
>> On 01/18/2016 03:04 PM, Peter Crosthwaite wrote:
>>> On Sun, Jan 17, 2016 at 10:50 PM, Jason Wang <jasowang@redhat.com> wr=
ote:
>>>> On 01/14/2016 05:43 PM, Michael S. Tsirkin wrote:
>>>>> gem_receive copies a packet received from network into an rxbuf[204=
8]
>>>>> array on stack, with size limited by descriptor length set by guest=
.  If
>>>>> guest is malicious and specifies a descriptor length that is too la=
rge,
>>>>> and should packet size exceed array size, this results in a buffer
>>>>> overflow.
>>>>>
>>>>> Reported-by: =E5=88=98=E4=BB=A4 <liuling-it@360.cn>
>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>>> ---
>>>>>  hw/net/cadence_gem.c | 8 ++++++++
>>>>>  1 file changed, 8 insertions(+)
>>>> Apply to my -net with tweak on commit log (changing receive to trans=
mit
>>>> as noticed).
>>>>
>>> As this is actually an unimplemented feature you should change the
>>> message to a LOG_UNIMP rather than a debug printf.
>>>
>>> Regards,
>>> Peter
>> Thanks for the reminding. But we need know the whether real device cou=
ld
>> send packet whose length is greater than 2048. Do you know the link to
>> the manual? (Haven't fond it in cadence page.) A hint is the linux
> Xilinx UG585 has details:
>
> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000=
-TRM.pdf
>
> Regards,
> Peter
>
>

Thanks for the pointer.

In section 16.1.5, it said

"Jumbo frames are not supported."

So it was in fact not an unimplemented feature?
