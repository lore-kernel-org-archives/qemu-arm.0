Received: by 10.182.158.201 with SMTP id ww9csp107159obb;
        Fri, 27 Nov 2015 11:39:22 -0800 (PST)
X-Received: by 10.140.95.2 with SMTP id h2mr2010969qge.91.1448653162163;
        Fri, 27 Nov 2015 11:39:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f129si15551909qhe.123.2015.11.27.11.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Nov 2015 11:39:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a2OrZ-0008Jt-Sp
	for alex.bennee@linaro.org; Fri, 27 Nov 2015 14:39:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a2OrD-0007tC-NI
	for qemu-devel@nongnu.org; Fri, 27 Nov 2015 14:39:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a2OrC-0001yd-Ls
	for qemu-devel@nongnu.org; Fri, 27 Nov 2015 14:38:59 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a2OrC-0001xz-G4; Fri, 27 Nov 2015 14:38:58 -0500
Received: by wmec201 with SMTP id c201so12274880wme.3;
	Fri, 27 Nov 2015 11:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5kvE5UqnKCWA9BiAnLhGbHZQ7MQ0TfK8PwpKDGY3UdE=;
	b=rt0WhNHPQcbEeLkV3w4WnycmYG3IGYRGYOLZS4y8dClOQWgjzJUwwzK1mBO2BUBx65
	5sjlerC5jaxJgVxmxiu9XRislns6C/Jw7N1aKuqnJ2aWeztmoCJBzn0FQ2FXmsntV+BT
	Y8ET074l95snSO/BpejBh8mMFh1oxDEtxpkoSDd92BhjvFqKJyH1hsBQ9ZaOIYJPavCW
	Xw8ObqDYZh/7qh35G4Bpvz4oggPRHHqG6FHgXer8HIhAirh92gSIaN9XzNb70Ub19Ikt
	9TMz+EKN8XzLDAFXTkL7apo9T3viEY1Y2PRbSJ1fXjmFq+5txiNDNrwpSACTNT57SVjN
	9mfw==
MIME-Version: 1.0
X-Received: by 10.28.210.74 with SMTP id j71mr12219042wmg.96.1448653137548;
	Fri, 27 Nov 2015 11:38:57 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Fri, 27 Nov 2015 11:38:57 -0800 (PST)
In-Reply-To: <1447946528-1533-5-git-send-email-eric.auger@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
	<1447946528-1533-5-git-send-email-eric.auger@linaro.org>
Date: Fri, 27 Nov 2015 11:38:57 -0800
Message-ID: <CAPokK=phO1o4cu17QU2Kt2j_mRKk6qWsCgOB0dP=7s8S_3wx7g@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Eric Auger <eric.auger@linaro.org>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::244
Cc: Peter Maydell <peter.maydell@linaro.org>, eric.auger@st.com,
	thomas.lendacky@amd.com, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, suravee.suthikulpanit@amd.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	b.reynal@virtualopensystems.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [RESEND RFC 4/6] device_tree: introduce
	qemu_fdt_getprop_optional
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
X-TUID: rAWHKT9Ssvlx

On Thu, Nov 19, 2015 at 7:22 AM, Eric Auger <eric.auger@linaro.org> wrote:
> Current qemu_fdt_getprop exits if the property is not found. It is
> sometimes needed to read an optional property, in which case we do
> not wish to exit but simply returns a null value.
>
> This is what this new qemu_fdt_getprop_optional function does.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> ---
>  device_tree.c                | 17 +++++++++++++++++
>  include/sysemu/device_tree.h |  2 ++
>  2 files changed, 19 insertions(+)
>
> diff --git a/device_tree.c b/device_tree.c
> index f184e3c..a318683 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -280,6 +280,23 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>      return r;
>  }
>
> +const void *qemu_fdt_getprop_optional(void *fdt, const char *node_path,
> +                             const char *property, bool optional, int *lenp)
> +{
> +    int len;
> +    const void *r;
> +    if (!lenp) {
> +        lenp = &len;
> +    }
> +    r = fdt_getprop(fdt, findnode_nofail(fdt, node_path), property, lenp);
> +    if (!r && !optional) {
> +        error_report("%s: Couldn't get %s/%s: %s", __func__,
> +                     node_path, property, fdt_strerror(*lenp));
> +        exit(1);
> +    }
> +    return r;
> +}
> +

The real problem here is that the device-tree API is self-asserting.
This looks the old _nofail system that we removed but just named in
reverse. The correct solution here is to use the Error API properly.
Convert qemu_fdt_getprop to accept an Error **, and all existing users
are converted to pass &error_fatal. This will preserve existing
behaviour. Then to use the API with your optional semantic your pass
NULL for the Error **.

Regards,
Peter

>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>                                 const char *property)
>  {
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index f9e6e6e..10cbe8e 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -34,6 +34,8 @@ int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>                               const char *target_node_path);
>  const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>                               const char *property, int *lenp);
> +const void *qemu_fdt_getprop_optional(void *fdt, const char *node_path,
> +                             const char *property, bool optional, int *lenp);
>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>                                 const char *property);
>  uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
> --
> 1.8.3.2
>
>
