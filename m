Received: by 10.25.159.19 with SMTP id i19csp1750578lfe;
        Sun, 17 Jan 2016 23:04:42 -0800 (PST)
X-Received: by 10.55.200.90 with SMTP id c87mr28139609qkj.79.1453100682170;
        Sun, 17 Jan 2016 23:04:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si19588070qgn.107.2016.01.17.23.04.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:04:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL3rl-0007zP-Nj
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:04:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3rQ-0007hK-Mz
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:04:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3rP-0004oL-PN
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:04:20 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:37113)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3rP-0004oF-I3; Mon, 18 Jan 2016 02:04:19 -0500
Received: by mail-wm0-x22c.google.com with SMTP id n5so48272506wmn.0;
	Sun, 17 Jan 2016 23:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=aQ1kKR8TWLiPX6gjC1Tg+gerzCzRJERilfJ9Z7gIipg=;
	b=SfS5Te0Om9Vf6yEH/Sqn0QlhbvP1YMoBMDZhOQ3mnHU5y2w6p1i7mYA1aQLrF2bKRl
	BdiweA3e4RDbN4WOybLaXe7lhXOUjn+dWFM6duQ5N5dVBNZxpvlusQWLSCJ9b72VYPMj
	ofNa8WTRnmKmIQ6vPCaDaQE21UqZiXthmJNMZRwdodUylaClSEGQ9uq3zcrKgcrfWSz4
	svWkk5XkH5N8z337tWoqk2PczFHV6/3KBQQbqLt8aaGuWJCztGr3LrlViLl+8rwW17+8
	1Wt64El3T1VMZmF+6gyDVTfbZQYMw53TCmfR9iXRPol60zFbHYsvh0Hg6N7J9dNupmpO
	Y/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=aQ1kKR8TWLiPX6gjC1Tg+gerzCzRJERilfJ9Z7gIipg=;
	b=cUHkrmtXzZ41cXNDnizGnfU992CSxWVNyDLNFv0pxvEK9FtxAvq20MHLHCsfjyAZ68
	GQULsQdZcAjBSqk89Eu7F8WuC9j+cnx3w+DQeE7FtQQHMNtnbGBzrjll9KrbWaPkgQt7
	s66zeOM+pLb3KQ1QtrPxZuNR4J1kVfq1AyW42DNAopLDyKCGG2B05z8Mb5fbzWUkgVkv
	2Ne83xF7NN0ldd8BEtabyz960FB/aTfFkg0bN8RH6yR07FZsb4Qw/YoR1Jmm9ubkUaf6
	JbucKnfqyCVta/ZXCrhxa1U3I9MiD6gLz4qzbb2zGJT30EgXz/dd3ZNYck60S2OVQ9ft
	LlgA==
X-Gm-Message-State: ALoCoQm1deLvwU4qJzpgpY4sjmFAau9Umbu3VBHRooLGccIOXru4rSdAClOjsqc8sRPRBnL/pwUX3s3UU5FF4QpSykUxYboVRQ==
MIME-Version: 1.0
X-Received: by 10.194.120.226 with SMTP id lf2mr22168233wjb.108.1453100658320; 
	Sun, 17 Jan 2016 23:04:18 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Sun, 17 Jan 2016 23:04:18 -0800 (PST)
In-Reply-To: <569C8B29.4040300@redhat.com>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<569C8B29.4040300@redhat.com>
Date: Sun, 17 Jan 2016 23:04:18 -0800
Message-ID: <CAPokK=ovLXz__Tbh--dB+GEFpgBK8w3erG=P2jNrKbY37eJWyg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Prasad Pandit <ppandit@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?5YiY5Luk?= <liuling-it@360.cn>
Subject: Re: [Qemu-devel] [PATCH] cadence_gem: fix buffer overflow
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xWROnUb+2Soc

On Sun, Jan 17, 2016 at 10:50 PM, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 01/14/2016 05:43 PM, Michael S. Tsirkin wrote:
>> gem_receive copies a packet received from network into an rxbuf[2048]
>> array on stack, with size limited by descriptor length set by guest.  If
>> guest is malicious and specifies a descriptor length that is too large,
>> and should packet size exceed array size, this results in a buffer
>> overflow.
>>
>> Reported-by: =E5=88=98=E4=BB=A4 <liuling-it@360.cn>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>  hw/net/cadence_gem.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>
> Apply to my -net with tweak on commit log (changing receive to transmit
> as noticed).
>

As this is actually an unimplemented feature you should change the
message to a LOG_UNIMP rather than a debug printf.

Regards,
Peter

> Thanks
>
>>
>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>> index 3639fc1..15a0786 100644
>> --- a/hw/net/cadence_gem.c
>> +++ b/hw/net/cadence_gem.c
>> @@ -862,6 +862,14 @@ static void gem_transmit(CadenceGEMState *s)
>>              break;
>>          }
>>
>> +        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_pack=
et)) {
>> +            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space 0=
x%x\n",
>> +                     (unsigned)packet_desc_addr,
>> +                     (unsigned)tx_desc_get_length(desc),
>> +                     sizeof(tx_packet) - (p - tx_packet));
>> +            break;
>> +        }
>> +
>>          /* Gather this fragment of the packet from "dma memory" to our =
contig.
>>           * buffer.
>>           */
>
