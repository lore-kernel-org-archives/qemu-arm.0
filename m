Received: by 10.25.21.96 with SMTP id l93csp311553lfi;
        Thu, 16 Jun 2016 06:15:38 -0700 (PDT)
X-Received: by 10.55.20.32 with SMTP id e32mr4914248qkh.210.1466082938698;
        Thu, 16 Jun 2016 06:15:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c74si26407103qke.37.2016.06.16.06.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Jun 2016 06:15:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDX90-0007KN-2H
	for alex.bennee@linaro.org; Thu, 16 Jun 2016 09:15:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bDX8s-0007K4-If
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 09:15:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bDX8m-0004Vc-ER
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 09:15:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1bDX8m-0004VT-0J; Thu, 16 Jun 2016 09:15:24 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A67068E1B;
	Thu, 16 Jun 2016 13:15:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-46.ams2.redhat.com
	[10.36.116.46])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5GDFDrY008574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 16 Jun 2016 09:15:14 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D65531138645; Thu, 16 Jun 2016 15:15:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <1463784024-17242-1-git-send-email-eblake@redhat.com>
	<1463784024-17242-12-git-send-email-eblake@redhat.com>
Date: Thu, 16 Jun 2016 15:15:12 +0200
In-Reply-To: <1463784024-17242-12-git-send-email-eblake@redhat.com> (Eric
	Blake's message of "Fri, 20 May 2016 16:40:20 -0600")
Message-ID: <87porh46n3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 16 Jun 2016 13:15:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 11/15] qapi: Change Netdev
 into a flat union
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Vincenzo Maffione <v.maffione@gmail.com>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Fleytman <dmitry@daynix.com>, Rob Herring <robh@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alexander Graf <agraf@suse.de>, Scott Feldman <sfeldma@gmail.com>,
	=?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <DirtY.iCE.hu@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"open list:Musicpal" <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Scott Wood <scottwood@freescale.com>,
	Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
	Luigi Rizzo <rizzo@iet.unipi.it>,
	David Gibson <david@gibson.dropbear.id.au>,
	Michael Walle <michael@walle.cc>,
	"open list:ppce500" <qemu-ppc@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	"open list:X86" <xen-devel@lists.xensource.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AbBe07gXFWa+

Eric Blake <eblake@redhat.com> writes:

> From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>
>
> Except qapi-schema.json, this patch was generated by:
>
> find . -name .git -prune -o -type f \! -name '*~' -print0 | \
>   xargs -0 sed -i \
>     -e 's/NetClientOptionsKind/NetClientDriver/g' \
>     -e 's/NET_CLIENT_OPTIONS_KIND_/NET_CLIENT_DRIVER_/g' \
>     -e 's/netdev->opts/netdev/g'

Uh, this is prone to descend into build trees and edit random crap.  I
used

    $ sed -i -e ... `git-ls-tree -r HEAD | awk '$2 =3D=3D "blob" { print $4=
 }'`

to verify this commit.  Differences noted inline.

>
> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com>
> Message-Id: <01a527fbf1a5de880091f98cf011616a78adeeee.1441627176.git.Dirt=
Y.iCE.hu@gmail.com>
>
> Additional changes:
> Rebase the patch on top of an earlier change from netdev->kind to
> netdev->type, so that tweak is no longer needed here.

I guess this is the "-e 's/netdev->kind/netdev->type/g'" you deleted
from Zolt=C3=A1n's commit message.

>                                                        Rebase to
> latest master which enhanced multiqueue.
>
> Rework so that NetdevLegacy doesn't pollute QMP command but is instead
> copied piecewise into the new Netdev, which means that NetClientOptions
> must still remain in qapi. Since legacy previously always rejected
> 'hubport', we can now make that explicit by having the two unions be
> slightly different; but that means we must manually map between the
> two structures.

I suspect this explains most of the differences between the sed script's
results and the actual patch.  Would it be possible to split the patch
into a mechanical and a manual part, for easier review?  If not, could
explain your manual edits in more detail?

> Signed-off-by: Eric Blake <eblake@redhat.com>
[...]
> index 8e79b55..490007c 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -1785,7 +1785,7 @@ pci_e1000_uninit(PCIDevice *dev)
>  }
>
>  static NetClientInfo net_e1000_info =3D {
> -    .type =3D NET_CLIENT_OPTIONS_KIND_NIC,
> +    .type =3D NET_CLIENT_DRIVER_NIC,
>      .size =3D sizeof(NICState),
>      .can_receive =3D e1000_can_receive,
>      .receive =3D e1000_receive,

I additionally get:

  diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
  index 692283f..825f0ba 100644
  --- a/hw/net/e1000e.c
  +++ b/hw/net/e1000e.c
  @@ -226,7 +226,7 @@ e1000e_set_link_status(NetClientState *nc)
   }

   static NetClientInfo net_e1000e_info =3D {
  -    .type =3D NET_CLIENT_OPTIONS_KIND_NIC,
  +    .type =3D NET_CLIENT_DRIVER_NIC,
       .size =3D sizeof(NICState),
       .can_receive =3D e1000e_nc_can_receive,
       .receive =3D e1000e_nc_receive,

Rebase needed?

> index f8a500f..89a149b 100644
> --- a/net/dump.c
> +++ b/net/dump.c
> @@ -172,7 +172,7 @@ static void dumpclient_cleanup(NetClientState *nc)
>  }
>
>  static NetClientInfo net_dump_info =3D {
> -    .type =3D NET_CLIENT_OPTIONS_KIND_DUMP,
> +    .type =3D NET_CLIENT_DRIVER_DUMP,
>      .size =3D sizeof(DumpNetClient),
>      .receive =3D dumpclient_receive,
>      .receive_iov =3D dumpclient_receive_iov,
> @@ -189,8 +189,8 @@ int net_init_dump(const Netdev *netdev, const char *n=
ame,
>      NetClientState *nc;
>      DumpNetClient *dnc;
>
> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_DUMP);
> -    dump =3D netdev->opts->u.dump.data;
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_DUMP);
> +    dump =3D &netdev->u.dump;

sed turns this into

       dump =3D netdev->u.dump.data;

Is this part of the manual changes?  More of the same below.

>
>      assert(peer);
>

Another possible case of "rebase needed":

  diff --git a/net/filter.c b/net/filter.c
  index 8ac79f3..888fe6d 100644
  --- a/net/filter.c
  +++ b/net/filter.c
  @@ -201,7 +201,7 @@ static void netfilter_complete(UserCreatable *uc, Err=
or **errp)
       }

       queues =3D qemu_find_net_clients_except(nf->netdev_id, ncs,
  -                                          NET_CLIENT_OPTIONS_KIND_NIC,
  +                                          NET_CLIENT_DRIVER_NIC,
                                             MAX_QUEUE_NUM);
       if (queues < 1) {
           error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "netdev",

> diff --git a/net/hub.c b/net/hub.c
> index ec4626f..32d8cf5 100644
> --- a/net/hub.c
> +++ b/net/hub.c
> @@ -131,7 +131,7 @@ static void net_hub_port_cleanup(NetClientState *nc)
>  }
>
>  static NetClientInfo net_hub_port_info =3D {
> -    .type =3D NET_CLIENT_OPTIONS_KIND_HUBPORT,
> +    .type =3D NET_CLIENT_DRIVER_HUBPORT,
>      .size =3D sizeof(NetHubPort),
>      .can_receive =3D net_hub_port_can_receive,
>      .receive =3D net_hub_port_receive,
> @@ -266,10 +266,10 @@ int net_hub_id_for_client(NetClientState *nc, int *=
id)
>  {
>      NetHubPort *port;
>
> -    if (nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_HUBPORT) {
> +    if (nc->info->type =3D=3D NET_CLIENT_DRIVER_HUBPORT) {
>          port =3D DO_UPCAST(NetHubPort, nc, nc);
>      } else if (nc->peer !=3D NULL && nc->peer->info->type =3D=3D
> -            NET_CLIENT_OPTIONS_KIND_HUBPORT) {
> +            NET_CLIENT_DRIVER_HUBPORT) {
>          port =3D DO_UPCAST(NetHubPort, nc, nc->peer);
>      } else {
>          return -ENOENT;
> @@ -286,9 +286,9 @@ int net_init_hubport(const Netdev *netdev, const char=
 *name,
>  {
>      const NetdevHubPortOptions *hubport;
>
> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_HUBPORT);
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_HUBPORT);
>      assert(!peer);
> -    hubport =3D netdev->opts->u.hubport.data;
> +    hubport =3D &netdev->u.hubport;

sed:
  +    hubport =3D netdev->u.hubport.data;

>
>      net_hub_add_port(hubport->hubid, name);
>      return 0;
> @@ -315,14 +315,14 @@ void net_hub_check_clients(void)
>              }
>
>              switch (peer->info->type) {
> -            case NET_CLIENT_OPTIONS_KIND_NIC:
> +            case NET_CLIENT_DRIVER_NIC:
>                  has_nic =3D 1;
>                  break;
> -            case NET_CLIENT_OPTIONS_KIND_USER:
> -            case NET_CLIENT_OPTIONS_KIND_TAP:
> -            case NET_CLIENT_OPTIONS_KIND_SOCKET:
> -            case NET_CLIENT_OPTIONS_KIND_VDE:
> -            case NET_CLIENT_OPTIONS_KIND_VHOST_USER:
> +            case NET_CLIENT_DRIVER_USER:
> +            case NET_CLIENT_DRIVER_TAP:
> +            case NET_CLIENT_DRIVER_SOCKET:
> +            case NET_CLIENT_DRIVER_VDE:
> +            case NET_CLIENT_DRIVER_VHOST_USER:
>                  has_host_dev =3D 1;
>                  break;
>              default:
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index df02f5b..6745b78 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -516,7 +516,7 @@ static void net_l2tpv3_cleanup(NetClientState *nc)
>  }
>
>  static NetClientInfo net_l2tpv3_info =3D {
> -    .type =3D NET_CLIENT_OPTIONS_KIND_L2TPV3,
> +    .type =3D NET_CLIENT_DRIVER_L2TPV3,
>      .size =3D sizeof(NetL2TPV3State),
>      .receive =3D net_l2tpv3_receive_dgram,
>      .receive_iov =3D net_l2tpv3_receive_dgram_iov,
> @@ -545,8 +545,8 @@ int net_init_l2tpv3(const Netdev *netdev,
>      s->queue_tail =3D 0;
>      s->header_mismatch =3D false;
>
> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_L2TPV3);
> -    l2tpv3 =3D netdev->opts->u.l2tpv3.data;
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_L2TPV3);
> +    l2tpv3 =3D &netdev->u.l2tpv3;

sed:
  +    l2tpv3 =3D netdev->u.l2tpv3.data;

>
>      if (l2tpv3->has_ipv6 && l2tpv3->ipv6) {
>          s->ipv6 =3D l2tpv3->ipv6;
> diff --git a/net/net.c b/net/net.c
> index ec4e700..c49a295 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -291,7 +291,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
>      NICState *nic;
>      int i, queues =3D MAX(1, conf->peers.queues);
>
> -    assert(info->type =3D=3D NET_CLIENT_OPTIONS_KIND_NIC);
> +    assert(info->type =3D=3D NET_CLIENT_DRIVER_NIC);
>      assert(info->size >=3D sizeof(NICState));
>
>      nic =3D g_malloc0(info->size + sizeof(NetClientState) * queues);
> @@ -362,13 +362,13 @@ void qemu_del_net_client(NetClientState *nc)
>      int queues, i;
>      NetFilterState *nf, *next;
>
> -    assert(nc->info->type !=3D NET_CLIENT_OPTIONS_KIND_NIC);
> +    assert(nc->info->type !=3D NET_CLIENT_DRIVER_NIC);
>
>      /* If the NetClientState belongs to a multiqueue backend, we will ch=
ange all
>       * other NetClientStates also.
>       */
>      queues =3D qemu_find_net_clients_except(nc->name, ncs,
> -                                          NET_CLIENT_OPTIONS_KIND_NIC,
> +                                          NET_CLIENT_DRIVER_NIC,
>                                            MAX_QUEUE_NUM);
>      assert(queues !=3D 0);
>
> @@ -377,7 +377,7 @@ void qemu_del_net_client(NetClientState *nc)
>      }
>
>      /* If there is a peer NIC, delete and cleanup client, but do not fre=
e. */
> -    if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_=
NIC) {
> +    if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_NIC) {
>          NICState *nic =3D qemu_get_nic(nc->peer);
>          if (nic->peer_deleted) {
>              return;
> @@ -433,7 +433,7 @@ void qemu_foreach_nic(qemu_nic_foreach func, void *op=
aque)
>      NetClientState *nc;
>
>      QTAILQ_FOREACH(nc, &net_clients, next) {
> -        if (nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_NIC) {
> +        if (nc->info->type =3D=3D NET_CLIENT_DRIVER_NIC) {
>              if (nc->queue_index =3D=3D 0) {
>                  func(qemu_get_nic(nc), opaque);
>              }
> @@ -605,7 +605,7 @@ void qemu_flush_or_purge_queued_packets(NetClientStat=
e *nc, bool purge)
>  {
>      nc->receive_disabled =3D 0;
>
> -    if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_=
HUBPORT) {
> +    if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_HUBPOR=
T) {
>          if (net_hub_flush(nc->peer)) {
>              qemu_notify_event();
>          }
> @@ -779,7 +779,7 @@ NetClientState *qemu_find_netdev(const char *id)
>      NetClientState *nc;
>
>      QTAILQ_FOREACH(nc, &net_clients, next) {
> -        if (nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_NIC)
> +        if (nc->info->type =3D=3D NET_CLIENT_DRIVER_NIC)
>              continue;
>          if (!strcmp(nc->name, id)) {
>              return nc;
> @@ -790,7 +790,7 @@ NetClientState *qemu_find_netdev(const char *id)
>  }
>
>  int qemu_find_net_clients_except(const char *id, NetClientState **ncs,
> -                                 NetClientOptionsKind type, int max)
> +                                 NetClientDriver type, int max)
>  {
>      NetClientState *nc;
>      int ret =3D 0;
> @@ -871,8 +871,8 @@ static int net_init_nic(const Netdev *netdev, const c=
har *name,
>      NICInfo *nd;
>      const NetLegacyNicOptions *nic;
>
> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_NIC);
> -    nic =3D netdev->opts->u.nic.data;
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_NIC);
> +    nic =3D &netdev->u.nic;

sed:
  +    nic =3D netdev->u.nic.data;

>
>      idx =3D nic_get_free_idx();
>      if (idx =3D=3D -1 || nb_nics >=3D MAX_NICS) {
> @@ -932,39 +932,38 @@ static int net_init_nic(const Netdev *netdev, const=
 char *name,
>  }
>
>
> -static int (* const net_client_init_fun[NET_CLIENT_OPTIONS_KIND__MAX])(
> +static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>      const Netdev *netdev,
>      const char *name,
>      NetClientState *peer, Error **errp) =3D {
> -        [NET_CLIENT_OPTIONS_KIND_NIC]       =3D net_init_nic,
> +        [NET_CLIENT_DRIVER_NIC]       =3D net_init_nic,
>  #ifdef CONFIG_SLIRP
> -        [NET_CLIENT_OPTIONS_KIND_USER]      =3D net_init_slirp,
> +        [NET_CLIENT_DRIVER_USER]      =3D net_init_slirp,
>  #endif
> -        [NET_CLIENT_OPTIONS_KIND_TAP]       =3D net_init_tap,
> -        [NET_CLIENT_OPTIONS_KIND_SOCKET]    =3D net_init_socket,
> +        [NET_CLIENT_DRIVER_TAP]       =3D net_init_tap,
> +        [NET_CLIENT_DRIVER_SOCKET]    =3D net_init_socket,
>  #ifdef CONFIG_VDE
> -        [NET_CLIENT_OPTIONS_KIND_VDE]       =3D net_init_vde,
> +        [NET_CLIENT_DRIVER_VDE]       =3D net_init_vde,
>  #endif
>  #ifdef CONFIG_NETMAP
> -        [NET_CLIENT_OPTIONS_KIND_NETMAP]    =3D net_init_netmap,
> +        [NET_CLIENT_DRIVER_NETMAP]    =3D net_init_netmap,
>  #endif
> -        [NET_CLIENT_OPTIONS_KIND_DUMP]      =3D net_init_dump,
> +        [NET_CLIENT_DRIVER_DUMP]      =3D net_init_dump,
>  #ifdef CONFIG_NET_BRIDGE
> -        [NET_CLIENT_OPTIONS_KIND_BRIDGE]    =3D net_init_bridge,
> +        [NET_CLIENT_DRIVER_BRIDGE]    =3D net_init_bridge,
>  #endif
> -        [NET_CLIENT_OPTIONS_KIND_HUBPORT]   =3D net_init_hubport,
> +        [NET_CLIENT_DRIVER_HUBPORT]   =3D net_init_hubport,
>  #ifdef CONFIG_VHOST_NET_USED
> -        [NET_CLIENT_OPTIONS_KIND_VHOST_USER] =3D net_init_vhost_user,
> +        [NET_CLIENT_DRIVER_VHOST_USER] =3D net_init_vhost_user,
>  #endif
>  #ifdef CONFIG_L2TPV3
> -        [NET_CLIENT_OPTIONS_KIND_L2TPV3]    =3D net_init_l2tpv3,
> +        [NET_CLIENT_DRIVER_L2TPV3]    =3D net_init_l2tpv3,
>  #endif
>  };
>
>
>  static int net_client_init1(const void *object, int is_netdev, Error **e=
rrp)
>  {

Multiple differences in this function.  Manual?

> -    const NetClientOptions *opts;
>      Netdev legacy =3D {0};
>      const Netdev *netdev;
>      const char *name;
> @@ -972,34 +971,72 @@ static int net_client_init1(const void *object, int=
 is_netdev, Error **errp)
>
>      if (is_netdev) {
>          netdev =3D object;
> -        opts =3D netdev->opts;
>          name =3D netdev->id;
>
> -        if (opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_DUMP ||
> -            opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_NIC ||
> -            !net_client_init_fun[opts->type]) {
> +        if (netdev->type =3D=3D NET_CLIENT_DRIVER_DUMP ||
> +            netdev->type =3D=3D NET_CLIENT_DRIVER_NIC ||
> +            !net_client_init_fun[netdev->type]) {
>              error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
>                         "a netdev backend type");
>              return -1;
>          }
>      } else {
>          const NetLegacy *net =3D object;
> +        const NetClientOptions *opts =3D net->opts;
>          legacy.id =3D net->id;
> -        opts =3D legacy.opts =3D net->opts;
>          netdev =3D &legacy;
>          /* missing optional values have been initialized to "all bits ze=
ro" */
>          name =3D net->has_id ? net->id : net->name;
>
> -        if (opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_NONE) {
> +        /* Map the old options to the new flat type */
> +        switch (opts->type) {
> +        case NET_CLIENT_OPTIONS_KIND_NONE:
>              return 0; /* nothing to do */
> -        }
> -        if (opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_HUBPORT) {
> -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
> -                       "a net type");
> -            return -1;
> +        case NET_CLIENT_OPTIONS_KIND_NIC:
> +            legacy.type =3D NET_CLIENT_DRIVER_NIC;
> +            legacy.u.nic =3D *opts->u.nic.data;
> +            break;
> +        case NET_CLIENT_OPTIONS_KIND_USER:
> +            legacy.type =3D NET_CLIENT_DRIVER_USER;
> +            legacy.u.user =3D *opts->u.user.data;
> +            break;
> +        case NET_CLIENT_OPTIONS_KIND_TAP:
> +            legacy.type =3D NET_CLIENT_DRIVER_TAP;
> +            legacy.u.tap =3D *opts->u.tap.data;
> +            break;
> +        case NET_CLIENT_OPTIONS_KIND_L2TPV3:
> +            legacy.type =3D NET_CLIENT_DRIVER_L2TPV3;
> +            legacy.u.l2tpv3 =3D *opts->u.l2tpv3.data;
> +            break;
> +        case NET_CLIENT_OPTIONS_KIND_SOCKET:
> +            legacy.type =3D NET_CLIENT_DRIVER_SOCKET;
> +            legacy.u.socket =3D *opts->u.socket.data;
> +            break;
> +        case NET_CLIENT_OPTIONS_KIND_VDE:
> +            legacy.type =3D NET_CLIENT_DRIVER_VDE;
> +            legacy.u.vde =3D *opts->u.vde.data;
> +            break;
> +        case NET_CLIENT_OPTIONS_KIND_DUMP:
> +            legacy.type =3D NET_CLIENT_DRIVER_DUMP;
> +            legacy.u.dump =3D *opts->u.dump.data;
> +            break;
> +        case NET_CLIENT_OPTIONS_KIND_BRIDGE:
> +            legacy.type =3D NET_CLIENT_DRIVER_BRIDGE;
> +            legacy.u.bridge =3D *opts->u.bridge.data;
> +            break;
> +        case NET_CLIENT_OPTIONS_KIND_NETMAP:
> +            legacy.type =3D NET_CLIENT_DRIVER_NETMAP;
> +            legacy.u.netmap =3D *opts->u.netmap.data;
> +            break;
> +        case NET_CLIENT_OPTIONS_KIND_VHOST_USER:
> +            legacy.type =3D NET_CLIENT_DRIVER_VHOST_USER;
> +            legacy.u.vhost_user =3D *opts->u.vhost_user.data;
> +            break;
> +        default:
> +            abort();
>          }
>
> -        if (!net_client_init_fun[opts->type]) {
> +        if (!net_client_init_fun[netdev->type]) {
>              error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
>                         "a net backend type (maybe it is not compiled "
>                         "into this binary)");
> @@ -1007,17 +1044,17 @@ static int net_client_init1(const void *object, i=
nt is_netdev, Error **errp)
>          }
>
>          /* Do not add to a vlan if it's a nic with a netdev=3D parameter=
. */
> -        if (opts->type !=3D NET_CLIENT_OPTIONS_KIND_NIC ||
> +        if (netdev->type !=3D NET_CLIENT_DRIVER_NIC ||
>              !opts->u.nic.data->has_netdev) {
>              peer =3D net_hub_add_port(net->has_vlan ? net->vlan : 0, NUL=
L);
>          }
>      }
>
> -    if (net_client_init_fun[opts->type](netdev, name, peer, errp) < 0) {
> +    if (net_client_init_fun[netdev->type](netdev, name, peer, errp) < 0)=
 {
>          /* FIXME drop when all init functions store an Error */
>          if (errp && !*errp) {
>              error_setg(errp, QERR_DEVICE_INIT_FAILED,
> -                       NetClientOptionsKind_lookup[opts->type]);
> +                       NetClientDriver_lookup[netdev->type]);
>          }
>          return -1;
>      }
> @@ -1137,7 +1174,7 @@ void hmp_host_net_remove(Monitor *mon, const QDict =
*qdict)
>                       device, vlan_id);
>          return;
>      }
> -    if (nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_NIC) {
> +    if (nc->info->type =3D=3D NET_CLIENT_DRIVER_NIC) {
>          error_report("invalid host network device '%s'", device);
>          return;
>      }
> @@ -1228,7 +1265,7 @@ void print_net_client(Monitor *mon, NetClientState =
*nc)
>
>      monitor_printf(mon, "%s: index=3D%d,type=3D%s,%s\n", nc->name,
>                     nc->queue_index,
> -                   NetClientOptionsKind_lookup[nc->info->type],
> +                   NetClientDriver_lookup[nc->info->type],
>                     nc->info_str);
>      if (!QTAILQ_EMPTY(&nc->filters)) {
>          monitor_printf(mon, "filters:\n");
> @@ -1258,7 +1295,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name=
, const char *name,
>          }
>
>          /* only query rx-filter information of NIC */
> -        if (nc->info->type !=3D NET_CLIENT_OPTIONS_KIND_NIC) {
> +        if (nc->info->type !=3D NET_CLIENT_DRIVER_NIC) {
>              if (has_name) {
>                  error_setg(errp, "net client(%s) isn't a NIC", name);
>                  return NULL;
> @@ -1304,7 +1341,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name=
, const char *name,
>  void hmp_info_network(Monitor *mon, const QDict *qdict)
>  {
>      NetClientState *nc, *peer;
> -    NetClientOptionsKind type;
> +    NetClientDriver type;
>
>      net_hub_info(mon);
>
> @@ -1317,10 +1354,10 @@ void hmp_info_network(Monitor *mon, const QDict *=
qdict)
>              continue;
>          }
>
> -        if (!peer || type =3D=3D NET_CLIENT_OPTIONS_KIND_NIC) {
> +        if (!peer || type =3D=3D NET_CLIENT_DRIVER_NIC) {
>              print_net_client(mon, nc);
>          } /* else it's a netdev connected to a NIC, printed with the NIC=
 */
> -        if (peer && type =3D=3D NET_CLIENT_OPTIONS_KIND_NIC) {
> +        if (peer && type =3D=3D NET_CLIENT_DRIVER_NIC) {
>              monitor_printf(mon, " \\ ");
>              print_net_client(mon, peer);
>          }
> @@ -1334,7 +1371,7 @@ void qmp_set_link(const char *name, bool up, Error =
**errp)
>      int queues, i;
>
>      queues =3D qemu_find_net_clients_except(name, ncs,
> -                                          NET_CLIENT_OPTIONS_KIND__MAX,
> +                                          NET_CLIENT_DRIVER__MAX,
>                                            MAX_QUEUE_NUM);
>
>      if (queues =3D=3D 0) {
> @@ -1361,7 +1398,7 @@ void qmp_set_link(const char *name, bool up, Error =
**errp)
>           * multiple clients that can still communicate with each other in
>           * disconnected mode. For now maintain this compatibility.
>           */
> -        if (nc->peer->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_NIC) {
> +        if (nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_NIC) {
>              for (i =3D 0; i < queues; i++) {
>                  ncs[i]->peer->link_down =3D !up;
>              }
> @@ -1402,7 +1439,7 @@ void net_cleanup(void)
>       */
>      while (!QTAILQ_EMPTY(&net_clients)) {
>          nc =3D QTAILQ_FIRST(&net_clients);
> -        if (nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_NIC) {
> +        if (nc->info->type =3D=3D NET_CLIENT_DRIVER_NIC) {
>              qemu_del_nic(qemu_get_nic(nc));
>          } else {
>              qemu_del_net_client(nc);
> @@ -1434,7 +1471,7 @@ void net_check_clients(void)
>      QTAILQ_FOREACH(nc, &net_clients, next) {
>          if (!nc->peer) {
>              fprintf(stderr, "Warning: %s %s has no peer\n",
> -                    nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_NIC ?
> +                    nc->info->type =3D=3D NET_CLIENT_DRIVER_NIC ?
>                      "nic" : "netdev", nc->name);
>          }
>      }
> diff --git a/net/netmap.c b/net/netmap.c
> index addeedd..aa2d34a 100644
> --- a/net/netmap.c
> +++ b/net/netmap.c
> @@ -401,7 +401,7 @@ static void netmap_set_offload(NetClientState *nc, in=
t csum, int tso4, int tso6,
>
>  /* NetClientInfo methods */
>  static NetClientInfo net_netmap_info =3D {
> -    .type =3D NET_CLIENT_OPTIONS_KIND_NETMAP,
> +    .type =3D NET_CLIENT_DRIVER_NETMAP,
>      .size =3D sizeof(NetmapState),
>      .receive =3D netmap_receive,
>      .receive_iov =3D netmap_receive_iov,
> @@ -422,7 +422,7 @@ static NetClientInfo net_netmap_info =3D {
>  int net_init_netmap(const Netdev *netdev,
>                      const char *name, NetClientState *peer, Error **errp)
>  {
> -    const NetdevNetmapOptions *netmap_opts =3D netdev->opts->u.netmap.da=
ta;
> +    const NetdevNetmapOptions *netmap_opts =3D &netdev->u.netmap;

sed:
  +    const NetdevNetmapOptions *netmap_opts =3D netdev->u.netmap.data;

>      struct nm_desc *nmd;
>      NetClientState *nc;
>      Error *err =3D NULL;
> diff --git a/net/slirp.c b/net/slirp.c
> index bb49629..5aafbf3 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -128,7 +128,7 @@ static void net_slirp_cleanup(NetClientState *nc)
>  }
>
>  static NetClientInfo net_slirp_info =3D {
> -    .type =3D NET_CLIENT_OPTIONS_KIND_USER,
> +    .type =3D NET_CLIENT_DRIVER_USER,
>      .size =3D sizeof(SlirpState),
>      .receive =3D net_slirp_receive,
>      .cleanup =3D net_slirp_cleanup,
> @@ -828,8 +828,8 @@ int net_init_slirp(const Netdev *netdev, const char *=
name,
>      const char **dnssearch;
>      bool ipv4 =3D true, ipv6 =3D true;
>
> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_USER);
> -    user =3D netdev->opts->u.user.data;
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_USER);
> +    user =3D &netdev->u.user;

sed:
  +    user =3D netdev->u.user.data;

>
>      if ((user->has_ipv6 && user->ipv6 && !user->has_ipv4) ||
>          (user->has_ipv4 && !user->ipv4)) {
> diff --git a/net/socket.c b/net/socket.c
> index d258352..b831afa 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -346,7 +346,7 @@ static void net_socket_cleanup(NetClientState *nc)
>  }
>
>  static NetClientInfo net_dgram_socket_info =3D {
> -    .type =3D NET_CLIENT_OPTIONS_KIND_SOCKET,
> +    .type =3D NET_CLIENT_DRIVER_SOCKET,
>      .size =3D sizeof(NetSocketState),
>      .receive =3D net_socket_receive_dgram,
>      .cleanup =3D net_socket_cleanup,
> @@ -429,7 +429,7 @@ static void net_socket_connect(void *opaque)
>  }
>
>  static NetClientInfo net_socket_info =3D {
> -    .type =3D NET_CLIENT_OPTIONS_KIND_SOCKET,
> +    .type =3D NET_CLIENT_DRIVER_SOCKET,
>      .size =3D sizeof(NetSocketState),
>      .receive =3D net_socket_receive,
>      .cleanup =3D net_socket_cleanup,
> @@ -704,8 +704,8 @@ int net_init_socket(const Netdev *netdev, const char =
*name,
>      Error *err =3D NULL;
>      const NetdevSocketOptions *sock;
>
> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_SOCKET);
> -    sock =3D netdev->opts->u.socket.data;
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_SOCKET);
> +    sock =3D &netdev->u.socket;

sed:
  +    sock =3D netdev->u.socket.data;

>
>      if (sock->has_fd + sock->has_listen + sock->has_connect + sock->has_=
mcast +
>          sock->has_udp !=3D 1) {
> diff --git a/net/tap-win32.c b/net/tap-win32.c
> index 0f23b19..729309d 100644
> --- a/net/tap-win32.c
> +++ b/net/tap-win32.c
> @@ -750,7 +750,7 @@ static void tap_set_vnet_hdr_len(NetClientState *nc, =
int len)
>  }
>
>  static NetClientInfo net_tap_win32_info =3D {
> -    .type =3D NET_CLIENT_OPTIONS_KIND_TAP,
> +    .type =3D NET_CLIENT_DRIVER_TAP,
>      .size =3D sizeof(TAPState),
>      .receive =3D tap_receive,
>      .cleanup =3D tap_cleanup,
> @@ -794,8 +794,8 @@ int net_init_tap(const Netdev *netdev, const char *na=
me,
>      /* FIXME error_setg(errp, ...) on failure */
>      const NetdevTapOptions *tap;
>
> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_TAP);
> -    tap =3D netdev->opts->u.tap.data;
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_TAP);
> +    tap =3D netdev->u.tap;

sed:
  +    tap =3D netdev->u.tap.data;

>
>      if (!tap->has_ifname) {
>          error_report("tap: no interface name");
> diff --git a/net/tap.c b/net/tap.c
> index 9531880..8844d90 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -222,7 +222,7 @@ static bool tap_has_ufo(NetClientState *nc)
>  {
>      TAPState *s =3D DO_UPCAST(TAPState, nc, nc);
>
> -    assert(nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_TAP);
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_TAP);
>
>      return s->has_ufo;
>  }
> @@ -231,7 +231,7 @@ static bool tap_has_vnet_hdr(NetClientState *nc)
>  {
>      TAPState *s =3D DO_UPCAST(TAPState, nc, nc);
>
> -    assert(nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_TAP);
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_TAP);
>
>      return !!s->host_vnet_hdr_len;
>  }
> @@ -240,7 +240,7 @@ static bool tap_has_vnet_hdr_len(NetClientState *nc, =
int len)
>  {
>      TAPState *s =3D DO_UPCAST(TAPState, nc, nc);
>
> -    assert(nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_TAP);
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_TAP);
>
>      return !!tap_probe_vnet_hdr_len(s->fd, len);
>  }
> @@ -249,7 +249,7 @@ static void tap_set_vnet_hdr_len(NetClientState *nc, =
int len)
>  {
>      TAPState *s =3D DO_UPCAST(TAPState, nc, nc);
>
> -    assert(nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_TAP);
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_TAP);
>      assert(len =3D=3D sizeof(struct virtio_net_hdr_mrg_rxbuf) ||
>             len =3D=3D sizeof(struct virtio_net_hdr));
>
> @@ -261,7 +261,7 @@ static void tap_using_vnet_hdr(NetClientState *nc, bo=
ol using_vnet_hdr)
>  {
>      TAPState *s =3D DO_UPCAST(TAPState, nc, nc);
>
> -    assert(nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_TAP);
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_TAP);
>      assert(!!s->host_vnet_hdr_len =3D=3D using_vnet_hdr);
>
>      s->using_vnet_hdr =3D using_vnet_hdr;
> @@ -327,14 +327,14 @@ static void tap_poll(NetClientState *nc, bool enabl=
e)
>  int tap_get_fd(NetClientState *nc)
>  {
>      TAPState *s =3D DO_UPCAST(TAPState, nc, nc);
> -    assert(nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_TAP);
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_TAP);
>      return s->fd;
>  }
>
>  /* fd support */
>
>  static NetClientInfo net_tap_info =3D {
> -    .type =3D NET_CLIENT_OPTIONS_KIND_TAP,
> +    .type =3D NET_CLIENT_DRIVER_TAP,
>      .size =3D sizeof(TAPState),
>      .receive =3D tap_receive,
>      .receive_raw =3D tap_receive_raw,
> @@ -566,8 +566,8 @@ int net_init_bridge(const Netdev *netdev, const char =
*name,
>      TAPState *s;
>      int fd, vnet_hdr;
>
> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_BRIDGE);
> -    bridge =3D netdev->opts->u.bridge.data;
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_BRIDGE);
> +    bridge =3D &netdev->u.bridge;

sed:
  +    bridge =3D netdev->u.bridge.data;

>
>      helper =3D bridge->has_helper ? bridge->helper : DEFAULT_BRIDGE_HELP=
ER;
>      br     =3D bridge->has_br     ? bridge->br     : DEFAULT_BRIDGE_INTE=
RFACE;
> @@ -729,8 +729,8 @@ int net_init_tap(const Netdev *netdev, const char *na=
me,
>      const char *vhostfdname;
>      char ifname[128];
>
> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_TAP);
> -    tap =3D netdev->opts->u.tap.data;
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_TAP);
> +    tap =3D &netdev->u.tap;

sed:
  +    tap =3D netdev->u.tap.data;

>      queues =3D tap->has_queues ? tap->queues : 1;
>      vhostfdname =3D tap->has_vhostfd ? tap->vhostfd : NULL;
>
> @@ -891,7 +891,7 @@ int net_init_tap(const Netdev *netdev, const char *na=
me,
>  VHostNetState *tap_get_vhost_net(NetClientState *nc)
>  {
>      TAPState *s =3D DO_UPCAST(TAPState, nc, nc);
> -    assert(nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_TAP);
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_TAP);
>      return s->vhost_net;
>  }
>
> diff --git a/net/vde.c b/net/vde.c
> index 53cdbbf..b8725f8 100644
> --- a/net/vde.c
> +++ b/net/vde.c
> @@ -68,7 +68,7 @@ static void vde_cleanup(NetClientState *nc)
>  }
>
>  static NetClientInfo net_vde_info =3D {
> -    .type =3D NET_CLIENT_OPTIONS_KIND_VDE,
> +    .type =3D NET_CLIENT_DRIVER_VDE,
>      .size =3D sizeof(VDEState),
>      .receive =3D vde_receive,
>      .cleanup =3D vde_cleanup,
> @@ -115,8 +115,8 @@ int net_init_vde(const Netdev *netdev, const char *na=
me,
>      /* FIXME error_setg(errp, ...) on failure */
>      const NetdevVdeOptions *vde;
>
> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_VDE);
> -    vde =3D netdev->opts->u.vde.data;
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VDE);
> +    vde =3D netdev->u.vde;

sed:
  +    vde =3D netdev->u.vde.data;

>
>      /* missing optional values have been initialized to "all bits zero" =
*/
>      if (net_vde_init(peer, "vde", name, vde->sock, vde->port, vde->group,
> diff --git a/net/vhost-user.c b/net/vhost-user.c
> index 4607c7b..01b5453 100644
> --- a/net/vhost-user.c
> +++ b/net/vhost-user.c
> @@ -32,7 +32,7 @@ typedef struct VhostUserChardevProps {
>  VHostNetState *vhost_user_get_vhost_net(NetClientState *nc)
>  {
>      VhostUserState *s =3D DO_UPCAST(VhostUserState, nc, nc);
> -    assert(nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_VHOST_USER);
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER);
>      return s->vhost_net;
>  }
>
> @@ -47,7 +47,7 @@ static void vhost_user_stop(int queues, NetClientState =
*ncs[])
>      int i;
>
>      for (i =3D 0; i < queues; i++) {
> -        assert (ncs[i]->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_VHOST_=
USER);
> +        assert(ncs[i]->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER);

Manual whitespace cleanup.  Okay.

>
>          s =3D DO_UPCAST(VhostUserState, nc, ncs[i]);
>          if (!vhost_user_running(s)) {
> @@ -71,7 +71,7 @@ static int vhost_user_start(int queues, NetClientState =
*ncs[])
>      options.backend_type =3D VHOST_BACKEND_TYPE_USER;
>
>      for (i =3D 0; i < queues; i++) {
> -        assert (ncs[i]->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_VHOST_=
USER);
> +        assert(ncs[i]->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER);

Likewise.

>
>          s =3D DO_UPCAST(VhostUserState, nc, ncs[i]);
>          if (vhost_user_running(s)) {
> @@ -146,20 +146,20 @@ static void vhost_user_cleanup(NetClientState *nc)
>
>  static bool vhost_user_has_vnet_hdr(NetClientState *nc)
>  {
> -    assert(nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_VHOST_USER);
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER);
>
>      return true;
>  }
>
>  static bool vhost_user_has_ufo(NetClientState *nc)
>  {
> -    assert(nc->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_VHOST_USER);
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER);
>
>      return true;
>  }
>
>  static NetClientInfo net_vhost_user_info =3D {
> -        .type =3D NET_CLIENT_OPTIONS_KIND_VHOST_USER,
> +        .type =3D NET_CLIENT_DRIVER_VHOST_USER,
>          .size =3D sizeof(VhostUserState),
>          .receive =3D vhost_user_receive,
>          .cleanup =3D vhost_user_cleanup,
> @@ -176,7 +176,7 @@ static void net_vhost_user_event(void *opaque, int ev=
ent)
>      int queues;
>
>      queues =3D qemu_find_net_clients_except(name, ncs,
> -                                          NET_CLIENT_OPTIONS_KIND_NIC,
> +                                          NET_CLIENT_DRIVER_NIC,
>                                            MAX_QUEUE_NUM);
>      assert(queues < MAX_QUEUE_NUM);
>
> @@ -305,8 +305,8 @@ int net_init_vhost_user(const Netdev *netdev, const c=
har *name,
>      const NetdevVhostUserOptions *vhost_user_opts;
>      CharDriverState *chr;
>
> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_VHOST_USER);
> -    vhost_user_opts =3D netdev->opts->u.vhost_user.data;
> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER);
> +    vhost_user_opts =3D &netdev->u.vhost_user;

sed:
  +    vhost_user_opts =3D netdev->u.vhost_user.data;

>
>      chr =3D net_vhost_parse_chardev(vhost_user_opts, errp);
>      if (!chr) {
