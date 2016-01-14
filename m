Received: by 10.25.159.19 with SMTP id i19csp1672265lfe;
        Thu, 14 Jan 2016 02:03:44 -0800 (PST)
X-Received: by 10.140.233.1 with SMTP id e1mr4195171qhc.42.1452765824349;
        Thu, 14 Jan 2016 02:03:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t105si6618366qgd.119.2016.01.14.02.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 02:03:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:41168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJekp-0004Po-S5
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 05:03:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJekj-0004J1-C0
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 05:03:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJeki-0002fo-BA
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 05:03:37 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJeki-0002fU-7K
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 05:03:36 -0500
Received: by mail-vk0-x22b.google.com with SMTP id i129so138906472vkb.0
	for <qemu-arm@nongnu.org>; Thu, 14 Jan 2016 02:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=GAvlXCDRtgorZw3QdLuXR2qsKqyuaBWODYkstodUWRM=;
	b=Zu4ybJR0Tv1LOJ4/mGDBcyL+NiZlmp64odCq7soEAlqwRpkczv6AWeDguSXayOYYaI
	b4B4VejgTct0fRqf0ArL9v6LIVR9N8nxfQQZV0L6RV4l2/s2s0oJ9UlSGtm7XbHmivp7
	xJTJDK4EKJOOHc83Fsnta9it+05NlNXGUvpnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=GAvlXCDRtgorZw3QdLuXR2qsKqyuaBWODYkstodUWRM=;
	b=I4Hd1KElZSQTmkdIzjCw+vi5m59eeZkrBPE3lyHYyW/POu+huKy12NSmIom2NvpXKE
	sDmDc4bLyhPZ5TJh7zn3tgtfUQ/Lo75F0fNI2Qifo6Z6bbYLn9dtgtlUO7UV0AYKVpjO
	DaiMDU07gYduRz6r5V6RDO2jvreuFX0s3iu+xcB9gt64Si7AtXcRzC9GeLinpfaA+Ezb
	1au1mrFrit7BRsV2lyYO4BD6p3qrwqWa4MZIf3kMJzOtlZKhCpbuD1pIWfVKB1zHpOW3
	0eG3pmVv+AUDQKdyEZEpiNk0/+CLp1Wk6Bds8kWXmuqLKKIwYQeW3I1TvURbe4ba8cU/
	GTtQ==
X-Gm-Message-State: ALoCoQlrfIO0drxYFjng/QJvcbuD79uP4+5GcvRIY0yLN4RjTn1EePtZJCVoS4DPZsK+ESCk/kuUD6eHs9pmBSx2t6IMnVSoH1/dTcSknBWAlXOTTpukwWc=
X-Received: by 10.31.47.197 with SMTP id v188mr2281525vkv.6.1452765814569;
	Thu, 14 Jan 2016 02:03:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 14 Jan 2016 02:03:15 -0800 (PST)
In-Reply-To: <1452764448-17953-1-git-send-email-mst@redhat.com>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jan 2016 10:03:15 +0000
Message-ID: <CAFEAcA8yjfMdRtYsmdR=vbSmm0=6wdiFff2oUzYxwoT=CMbxyA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Prasad Pandit <ppandit@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?5YiY5Luk?= <liuling-it@360.cn>
Subject: Re: [Qemu-arm] [PATCH] cadence_gem: fix buffer overflow
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
X-TUID: MFW+h5K4n8YE

On 14 January 2016 at 09:43, Michael S. Tsirkin <mst@redhat.com> wrote:
> gem_receive copies a packet received from network into an rxbuf[2048]
> array on stack, with size limited by descriptor length set by guest.  If
> guest is malicious and specifies a descriptor length that is too large,
> and should packet size exceed array size, this results in a buffer
> overflow.
>
> Reported-by: =E5=88=98=E4=BB=A4 <liuling-it@360.cn>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/net/cadence_gem.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 3639fc1..15a0786 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -862,6 +862,14 @@ static void gem_transmit(CadenceGEMState *s)
>              break;
>          }
>
> +        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_packe=
t)) {
> +            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space 0x=
%x\n",
> +                     (unsigned)packet_desc_addr,
> +                     (unsigned)tx_desc_get_length(desc),
> +                     sizeof(tx_packet) - (p - tx_packet));
> +            break;
> +        }

Is this what the real hardware does in this situation?
Should we log this as a guest error?

> +
>          /* Gather this fragment of the packet from "dma memory" to our c=
ontig.
>           * buffer.
>           */
> --
> MST
>

thanks
-- PMM
