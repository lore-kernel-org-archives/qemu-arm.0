Received: by 10.25.21.156 with SMTP id 28csp834575lfv;
        Wed, 3 Aug 2016 09:37:52 -0700 (PDT)
X-Received: by 10.237.41.225 with SMTP id o88mr985498qtd.18.1470242268532;
        Wed, 03 Aug 2016 09:37:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 132si2674797qkl.45.2016.08.03.09.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Aug 2016 09:37:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUzAx-0002EK-Pe
	for alex.bennee@linaro.org; Wed, 03 Aug 2016 12:37:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bUzAo-00029u-Uc
	for qemu-arm@nongnu.org; Wed, 03 Aug 2016 12:37:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bUzAk-0002oa-2z
	for qemu-arm@nongnu.org; Wed, 03 Aug 2016 12:37:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43776)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bUzAj-0002oK-Ql; Wed, 03 Aug 2016 12:37:34 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52C4E3F725;
	Wed,  3 Aug 2016 16:37:33 +0000 (UTC)
Received: from [10.36.112.74] (ovpn-112-74.ams2.redhat.com [10.36.112.74])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u73GbQoZ020244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 3 Aug 2016 12:37:29 -0400
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1470241360-3574-1-git-send-email-berrange@redhat.com>
	<1470241360-3574-2-git-send-email-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1e1c4e9b-d94d-29bb-7700-4446d7032c0a@redhat.com>
Date: Wed, 3 Aug 2016 18:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1470241360-3574-2-git-send-email-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 03 Aug 2016 16:37:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/5] virtio-console: set frontend open
 permanently for console devs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Amit Shah <amit.shah@redhat.com>, Cornelia Huck <cornelia.huck@de.ibm.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LxRcfPydAqBF



On 03/08/2016 18:22, Daniel P. Berrange wrote:
> The virtio-console.c file handles both serial consoles
> and interactive consoles, since they're backed by the
> same device model.
> 
> Since serial devices are expected to be reliable and
> need to notify the guest when the backend is opened
> or closed, the virtio-console.c file wires up support
> for chardev events. This affects both serial consoles
> and interactive consoles, using a network connection
> based chardev backend such as 'socket', but not when
> using a PTY based backend or plain 'file' backends.
> 
> When the host side is not connected the handle_output()
> method in virtio-serial-bus.c will drop any data sent
> by the guest, before it even reaches the virtio-console.c
> code. This means that if the chardev has a logfile
> configured, the data will never get logged.
> 
> Consider for example, configuring a x86_64 guest with a
> plain UART serial port
> 
>   -chardev socket,id=charserial1,host=127.0.0.1,port=9001,server,nowait,logfile=console1.log,logappend=on
>   -device isa-serial,chardev=charserial1,id=serial1
> 
> vs a s390 guest which has to use the virtio-console port
> 
>   -chardev socket,id=charconsole1,host=127.0.0.1,port=9000,server,nowait,logfile=console2.log,logappend=on
>   -device virtconsole,chardev=charconsole1,id=console1
> 
> The isa-serial one gets data written to the log regardless
> of whether a client is connected, while the virtioconsole
> one only gets data written to the log when a client is
> connected.
> 
> There is no need for virtio-serial-bus.c to aggressively
> drop the data for console devices, as the chardev code is
> prefectly capable of discarding the data itself.
> 
> So this patch changes virtconsole devices so that they
> are always marked as having the host side open. This
> ensures that the guest OS will always send any data it
> has (Linux virtio-console hvc driver actually ignores
> the host open state and sends data regardless, but we
> should not rely on that), and also prevents the
> virtio-serial-bus code prematurely discarding data.
> 
> The behaviour of virtserialport devices is *not* changed,
> only virtconsole, because for the former, it is important
> that the guest OSknow exactly when the host side is opened
> / closed so it can do any protocol re-negotiation that may
> be required.
> 
> Fixes bug: https://bugs.launchpad.net/qemu/+bug/1599214
> 
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  hw/char/virtio-console.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
> index 2e36481..4f0e03d 100644
> --- a/hw/char/virtio-console.c
> +++ b/hw/char/virtio-console.c
> @@ -85,8 +85,9 @@ static void set_guest_connected(VirtIOSerialPort *port, int guest_connected)
>  {
>      VirtConsole *vcon = VIRTIO_CONSOLE(port);
>      DeviceState *dev = DEVICE(port);
> +    VirtIOSerialPortClass *k = VIRTIO_SERIAL_PORT_GET_CLASS(port);
>  
> -    if (vcon->chr) {
> +    if (vcon->chr && !k->is_console) {
>          qemu_chr_fe_set_open(vcon->chr, guest_connected);
>      }
>  
> @@ -156,9 +157,25 @@ static void virtconsole_realize(DeviceState *dev, Error **errp)
>      }
>  
>      if (vcon->chr) {
> -        vcon->chr->explicit_fe_open = 1;
> -        qemu_chr_add_handlers(vcon->chr, chr_can_read, chr_read, chr_event,
> -                              vcon);
> +        /*
> +         * For consoles we don't block guest data transfer just
> +         * because nothing is connected - we'll just let it go
> +         * whetherever the chardev wants - /dev/null probably.
> +         *
> +         * For serial ports we need 100% reliable data transfer
> +         * so we use the opened/closed signals from chardev to
> +         * trigger open/close of the device
> +         */
> +        if (k->is_console) {
> +            vcon->chr->explicit_fe_open = 0;
> +            qemu_chr_add_handlers(vcon->chr, chr_can_read, chr_read,
> +                                  NULL, vcon);
> +            virtio_serial_open(port);
> +        } else {
> +            vcon->chr->explicit_fe_open = 1;
> +            qemu_chr_add_handlers(vcon->chr, chr_can_read, chr_read,
> +                                  chr_event, vcon);
> +        }
>      }
>  }
>  
> 

I think this patch should go in 2.7, perhaps patch 2 too.  Everything
else can wait for 2.8.

Paolo
