Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8163574wrx;
        Fri, 8 Mar 2019 01:53:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQj6pzTejZgVF2GKwJTPBGQozHBiIG/d52GKkwn9oGlRAC3DikQbuvXeqF4Nn5oQjPmhAl
X-Received: by 2002:a81:a4ca:: with SMTP id b193mr1866871ywh.94.1552038786517;
        Fri, 08 Mar 2019 01:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552038786; cv=none;
        d=google.com; s=arc-20160816;
        b=U3zBrebv6t0gy6KDUIi9P3AxHYnuR5AJ66qE36DF4Xg8XC8woSu6rlLKjvexQBIY+1
         +IvvTv914vJg0XoEpOc03B6rfl4ZBQ3u8FusJiKN830GVKV864WFTQrJBiR/IYLPqDMC
         xN3D/nJ3ietHa7WgGf0BbJcS9gglszuxGIbr6vDtvOo5ysI2mkoWXvxvw+uSfPrVWzn6
         kO7ufVWvK5HpQRqRoby54PmbGuzzGwWOOd/677PPU73zcqGki85yliF+GU6h9Y2WjjIe
         rl+DxHb3GT/Hmw6kKDreLQk9Sr36aVAii58iQsImlqy3igW05i27drlvka+CxtEh/pRq
         RI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=KRJ/ByqLbM35gQ08tf3EBYDhFRacJtkK9BFBwrLDp0c=;
        b=ac2PJCYFHLa6B7OzllBoA14qFgmkITiZhmv4M5PWWCI1Ph5ohrVS0hleC/UpdMaeNV
         oF9erV5sre9llCX7UZSd/EgJvAwhK+1NOc4cBPvmIhC70rql9x28xJg4ceGGykREdB5b
         xl5j9jGsZyyX/V1cOHXhFR3XtwI9ZNSCgVGqecqnAlWQ8szwVhKV5rGr2b7t6i1s2uOT
         IgfI8NmXwDCh6MoPovjv+bQje3BKmaIjbjxhaTaQdu/DtfTbgiIaSPFvIe35v3MN1p7G
         R5Uv9oJOdXCaTREDaPmNR3BAw42wxlLgFbIacmLzBoNLN1ztst0lkwEx4k55T+B2EWuO
         JNwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i207si4133010ywa.448.2019.03.08.01.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 01:53:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2CBe-0007NV-0c
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 04:53:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2C7E-000461-Ue
	for qemu-devel@nongnu.org; Fri, 08 Mar 2019 04:48:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2C7D-0008Ap-PS
	for qemu-devel@nongnu.org; Fri, 08 Mar 2019 04:48:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41250)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h2C7B-00086y-0q; Fri, 08 Mar 2019 04:48:29 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33903307E076;
	Fri,  8 Mar 2019 09:48:28 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-151.rdu2.redhat.com
	[10.10.120.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E55D1A933;
	Fri,  8 Mar 2019 09:48:08 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-4-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <71bce75b-a2a9-061b-a1c2-7c4e49d957b1@redhat.com>
Date: Fri, 8 Mar 2019 10:48:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 08 Mar 2019 09:48:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 03/18] cutils: Add qemu_strdup_hexlify()
 and qemu_strdup_unhexlify()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aeePGn1oxY16

Hi Phil,

most important comment at the bottom.

On 03/08/19 02:32, Philippe Mathieu-Daud=C3=A9 wrote:
> Add two helpers: one to represent a binary data as a string of
> hexadecimal values, and one to restore a such string into its
> original binary data.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/qemu/cutils.h | 33 ++++++++++++++++++++++++++
>  util/cutils.c         | 55 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+)
>=20
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index d2dad3057c..375a5508b0 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -171,6 +171,39 @@ bool test_buffer_is_zero_next_accel(void);
>  int uleb128_encode_small(uint8_t *out, uint32_t n);
>  int uleb128_decode_small(const uint8_t *in, uint32_t *n);
> =20
> +/**
> + * qemu_strdup_hexlify:

(1) I think the name "hexlify" is unusual. I think we should use
encode/decode terminology, or hex/unhex, or, if we want to stick with
the "stringify" pattern, hexify/unhexify. (No "l".)

> + *
> + * Encode a sequence of binary data into its hexadecimal stringified
> + * representation.
> + *
> + * @ptr: Buffer to hexlify
> + * @size: Length of the buffer
> + *
> + * Use qemu_strdup_unhexlify() to convert the hex string to original d=
ata.
> + *
> + * Returns: A newly allocated, zero-terminated hex encoded string repr=
esenting
> + * the data. The returned string must be freed with g_free().
> + */
> +gchar *qemu_strdup_hexlify(gconstpointer ptr, gsize size);
> +
> +/**
> + * qemu_strdup_unhexlify:
> + *
> + * Decode a sequence of hexadecimal encoded text into binary data.
> + *
> + * @hex_string: String to unhexlify
> + * @out_size: if not NULL: gsize to be written with the data length
> + *
> + * This function is the opposite of qemu_strdup_hexlify().
> + *
> + * Returns: A newly allocated buffer containing the binary data that t=
ext
> + * represents. The returned buffer must be freed with g_free().
> + * Note that the returned binary data is not necessarily zero-terminat=
ed,
> + * so it should not be used as a character string.
> + */
> +gpointer qemu_strdup_unhexlify(const gchar *hex_string, gsize *out_siz=
e);
> +
>  /**
>   * qemu_pstrcmp0:
>   * @str1: a non-NULL pointer to a C string (*str1 can be NULL)
> diff --git a/util/cutils.c b/util/cutils.c
> index e098debdc0..bf324c0d8b 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -779,6 +779,61 @@ int uleb128_decode_small(const uint8_t *in, uint32=
_t *n)
>      }
>  }
> =20
> +static guchar hexval(const gchar v)
> +{
> +    switch (v) {
> +    case '0' ... '9':
> +        return v - '0';
> +    case 'A' ... 'F':
> +        return v - 'A' + 10;
> +    case 'a' ... 'f':
> +        return v - 'a' + 10;
> +    default:
> +        return 0;
> +    }
> +}

(2) I don't think that we should silently translate invalid characters
to zero, in any hexadecimal decoder.

> +
> +gchar *qemu_strdup_hexlify(gconstpointer ptr, gsize len)
> +{
> +    guchar *data =3D (guchar *)ptr;
> +    gchar *hex_string;
> +
> +    if (!ptr || !len) {
> +        return g_strdup("");
> +    }
> +
> +    hex_string =3D g_malloc(2 * len + 1);

(3) Should check against integer overflow in the g_malloc() argument
(multiplication and addition).

> +    for (gsize i =3D 0; i < len; i++) {
> +        g_snprintf(&hex_string[2 * i], 3, "%02x", data[i]);
> +    }
> +
> +    return hex_string;
> +}
> +
> +gpointer qemu_strdup_unhexlify(const gchar *hex_string, gsize *out_siz=
e)
> +{
> +    size_t size =3D 0;
> +    guchar *data =3D NULL;
> +
> +    if (hex_string) {
> +        size =3D strlen(hex_string) / 2;

(4) Should likely check that the length of the string is an even integer.

> +        if (size) {
> +            size_t i;
> +
> +            data =3D g_new(guchar, size + 1);
> +            for (i =3D 0; i < size; i++) {
> +                data[i]  =3D hexval(*hex_string++) << 4;
> +                data[i] |=3D hexval(*hex_string++);
> +            }
> +            data[i] =3D '\0';
> +        }
> +    }
> +    if (out_size) {
> +        *out_size =3D size;
> +    }
> +    return data;
> +}
> +
>  /*
>   * helper to parse debug environment variables
>   */
>=20

(5) Most importantly: I don't think we need this patch.

First, AFAICS, the unhex function is never used in the series, and no
unit test is being added for it. That makes it a bad candidate for
"include/qemu/cutils.h".

Second, while the hex function is used in PATCH v2 13/18
("hw/nvram/fw_cfg: Add QMP 'info fw_cfg' command"), the documentation in
that patch and the logic in the patch are inconsistent. The
documentation -- i.e. both the commit message and the "misc.json" change
-- say that "FirmwareConfigurationItem.data" is unused (not populated).
However, that's exactly what create_qmp_fw_cfg_item() uses the hex
function for.

Third, if we do decide that the QMP command should output the fw_cfg
binary data, then the QMP tradition (to my knowledge) has been to use
base64 encoding. GLib provides helpers for base64:

https://developer.gnome.org/glib/stable/glib-Base64-Encoding.html

and you can see examples of it being used in e.g.

(a) qmp_ringbuf_read() [chardev/char-ringbuf.c] -- the  @ringbuf-read
command is defined in "qapi/char.json"

(b) qmp_guest_exec_status() [qga/commands.c] -- the @guest-exec-status
command is defined in "qga/qapi-schema.json".

Thanks
Laszlo
